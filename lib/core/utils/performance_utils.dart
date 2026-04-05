import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// 性能监控工具类
class PerformanceUtils {
  static final PerformanceUtils _instance = PerformanceUtils._internal();
  factory PerformanceUtils() => _instance;
  PerformanceUtils._internal();

  final Map<String, Stopwatch> _timers = {};
  final _memoryUsageController = StreamController<int>.broadcast();
  Timer? _memoryTimer;

  Stream<int> get memoryUsageStream => _memoryUsageController.stream;

  /// 开始计时
  void startTimer(String label) {
    if (kReleaseMode) return;
    _timers[label] = Stopwatch()..start();
  }

  /// 结束计时并打印
  void endTimer(String label) {
    if (kReleaseMode) return;
    final timer = _timers.remove(label);
    if (timer != null) {
      timer.stop();
      developer.log('$label: ${timer.elapsedMilliseconds}ms', name: 'Performance');
    }
  }

  /// 监控方法执行时间
  Future<T> measure<T>(
    String label,
    Future<T> Function() action,
  ) async {
    startTimer(label);
    try {
      return await action();
    } finally {
      endTimer(label);
    }
  }

  /// 开始内存监控
  void startMemoryMonitoring({Duration interval = const Duration(seconds: 30)}) {
    _memoryTimer?.cancel();
    _memoryTimer = Timer.periodic(interval, (_) {
      _checkMemoryUsage();
    });
  }

  /// 停止内存监控
  void stopMemoryMonitoring() {
    _memoryTimer?.cancel();
    _memoryTimer = null;
  }

  /// 检查内存使用
  void _checkMemoryUsage() {
    // 获取当前内存使用（仅支持部分平台）
    final memory = _getCurrentMemoryUsage();
    if (memory != null) {
      _memoryUsageController.add(memory);

      // 内存警告
      if (memory > 200 * 1024 * 1024) { // 200MB
        developer.log('内存使用过高: ${_formatBytes(memory)}', name: 'Performance');
      }
    }
  }

  /// 获取当前内存使用
  int? _getCurrentMemoryUsage() {
    try {
      // 在支持的平台获取内存信息
      return null; // 需要平台特定实现
    } catch (e) {
      return null;
    }
  }

  /// 格式化字节数
  String _formatBytes(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(2)} KB';
    if (bytes < 1024 * 1024 * 1024) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(2)} MB';
    }
    return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(2)} GB';
  }

  /// 释放资源
  void dispose() {
    _memoryTimer?.cancel();
    _memoryUsageController.close();
    _timers.clear();
  }
}

/// 图片缓存管理
class ImageCacheManager {
  static final ImageCacheManager _instance = ImageCacheManager._internal();
  factory ImageCacheManager() => _instance;
  ImageCacheManager._internal();

  /// 清除图片缓存
  void clearCache() {
    PaintingBinding.instance.imageCache.clear();
    PaintingBinding.instance.imageCache.clearLiveImages();
  }

  /// 设置缓存大小限制
  void setCacheSize({
    int maxSize = 1000, // 最大缓存图片数
    int maxSizeBytes = 100 * 1024 * 1024, // 100MB
  }) {
    PaintingBinding.instance.imageCache.maximumSize = maxSize;
    PaintingBinding.instance.imageCache.maximumSizeBytes = maxSizeBytes;
  }

  /// 获取缓存统计
  Map<String, dynamic> getCacheStats() {
    final cache = PaintingBinding.instance.imageCache;
    return {
      'currentSize': cache.currentSize,
      'currentSizeBytes': cache.currentSizeBytes,
      'maximumSize': cache.maximumSize,
      'maximumSizeBytes': cache.maximumSizeBytes,
      'hitRate': cache.liveImageCount / (cache.currentSize + 1),
    };
  }
}

/// 列表性能优化
class ListPerformanceUtils {
  /// 计算列表项缓存范围
  static double calculateCacheExtent(
    int itemCount,
    double itemHeight, {
    double viewportHeight = 600,
    int cacheCount = 5,
  }) {
    final visibleCount = (viewportHeight / itemHeight).ceil();
    final cacheHeight = cacheCount * itemHeight;
    return cacheHeight;
  }

  /// 优化列表重建
  static Widget optimizeListItem(
    Widget child, {
    Key? key,
    bool addRepaintBoundary = true,
  }) {
    if (addRepaintBoundary) {
      return RepaintBoundary(
        key: key,
        child: child,
      );
    }
    return KeyedSubtree(
      key: key,
      child: child,
    );
  }
}

/// 内存优化工具
class MemoryUtils {
  /// 建议的释放内存操作
  static void suggestMemoryOptimization() {
    // 清除图片缓存
    ImageCacheManager().clearCache();

    // 触发垃圾回收（建议性）
    if (!kReleaseMode) {
      developer.log('建议释放内存', name: 'Memory');
    }
  }

  /// 监听低内存警告
  static void listenToLowMemory(VoidCallback onLowMemory) {
    // 在支持的平台监听低内存警告
    // 需要平台特定实现
  }
}

/// 启动优化工具
class StartupOptimizer {
  static final List<Future<void> Function()> _initTasks = [];

  /// 注册初始化任务
  static void registerInitTask(Future<void> Function() task) {
    _initTasks.add(task);
  }

  /// 并行执行初始化任务
  static Future<void> runInitTasks() async {
    await Future.wait(_initTasks.map((task) => task()));
    _initTasks.clear();
  }

  /// 延迟加载组件
  static Widget deferredLoad({
    required Widget Function() builder,
    Widget? placeholder,
    Duration delay = const Duration(milliseconds: 100),
  }) {
    return FutureBuilder(
      future: Future.delayed(delay),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return builder();
        }
        return placeholder ?? const SizedBox.shrink();
      },
    );
  }
}
