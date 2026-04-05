import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// 平台工具类
class PlatformUtils {
  /// 是否是移动平台
  static bool get isMobile => isIOS || isAndroid;

  /// 是否是桌面平台
  static bool get isDesktop => isWindows || isMacOS || isLinux;

  /// 是否是Web平台
  static bool get isWeb => kIsWeb;

  /// 是否是iOS
  static bool get isIOS => !kIsWeb && Platform.isIOS;

  /// 是否是Android
  static bool get isAndroid => !kIsWeb && Platform.isAndroid;

  /// 是否是Windows
  static bool get isWindows => !kIsWeb && Platform.isWindows;

  /// 是否是macOS
  static bool get isMacOS => !kIsWeb && Platform.isMacOS;

  /// 是否是Linux
  static bool get isLinux => !kIsWeb && Platform.isLinux;

  /// 获取平台名称
  static String get platformName {
    if (kIsWeb) return 'Web';
    if (Platform.isIOS) return 'iOS';
    if (Platform.isAndroid) return 'Android';
    if (Platform.isWindows) return 'Windows';
    if (Platform.isMacOS) return 'macOS';
    if (Platform.isLinux) return 'Linux';
    return 'Unknown';
  }

  /// 设置状态栏样式（仅移动平台）
  static void setSystemUIOverlayStyle({
    Brightness? statusBarBrightness,
    Color? statusBarColor,
  }) {
    if (!isMobile) return;

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarBrightness: statusBarBrightness,
        statusBarColor: statusBarColor ?? Colors.transparent,
        statusBarIconBrightness: statusBarBrightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark,
      ),
    );
  }

  /// 启用沉浸式状态栏
  static void enableImmersiveMode() {
    if (!isMobile) return;

    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
      overlays: [SystemUiOverlay.top],
    );
  }

  /// 退出沉浸式模式
  static void disableImmersiveMode() {
    if (!isMobile) return;

    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
  }

  /// 设置屏幕方向
  static void setPreferredOrientations(List<DeviceOrientation> orientations) {
    SystemChrome.setPreferredOrientations(orientations);
  }

  /// 锁定竖屏
  static void lockPortrait() {
    setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  /// 锁定横屏
  static void lockLandscape() {
    setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  /// 允许所有方向
  static void allowAllOrientations() {
    setPreferredOrientations(DeviceOrientation.values);
  }

  /// 隐藏键盘
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  /// 显示键盘
  static void showKeyboard(BuildContext context, FocusNode focusNode) {
    FocusScope.of(context).requestFocus(focusNode);
  }

  /// 获取安全区域padding
  static EdgeInsets getSafeAreaPadding(BuildContext context) {
    return MediaQuery.of(context).padding;
  }

  /// 获取底部安全区域高度
  static double getBottomSafeAreaHeight(BuildContext context) {
    return MediaQuery.of(context).padding.bottom;
  }

  /// 获取顶部安全区域高度
  static double getTopSafeAreaHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  /// 平台特定的地图API密钥
  static String get mapsApiKey {
    if (isIOS) {
      return const String.fromEnvironment('AMAP_IOS_KEY', defaultValue: '');
    }
    if (isAndroid) {
      return const String.fromEnvironment('AMAP_ANDROID_KEY', defaultValue: '');
    }
    return '';
  }

  /// 平台特定的存储路径
  static String? get documentsPath {
    // Returns platform-specific documents path
    return null;
  }

  static String? get cachePath {
    // Returns platform-specific cache path
    return null;
  }

  /// 检查是否支持某个功能
  static bool supportsFeature(PlatformFeature feature) {
    switch (feature) {
      case PlatformFeature.camera:
        return isMobile;
      case PlatformFeature.gallery:
        return isMobile;
      case PlatformFeature.pushNotification:
        return isMobile;
      case PlatformFeature.biometric:
        return isMobile;
      case PlatformFeature.share:
        return true;
      case PlatformFeature.maps:
        return isMobile;
      case PlatformFeature.bluetooth:
        return isMobile || isDesktop;
    }
  }
}

/// 平台功能枚举
enum PlatformFeature {
  camera,
  gallery,
  pushNotification,
  biometric,
  share,
  maps,
  bluetooth,
}

/// 屏幕适配工具
class ScreenAdapter {
  /// 根据设计稿宽度计算实际宽度
  static double adaptWidth(
    double designWidth, {
    double designScreenWidth = 375,
    required BuildContext context,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    return designWidth * screenWidth / designScreenWidth;
  }

  /// 根据设计稿高度计算实际高度
  static double adaptHeight(
    double designHeight, {
    double designScreenHeight = 812,
    required BuildContext context,
  }) {
    final screenHeight = MediaQuery.of(context).size.height;
    return designHeight * screenHeight / designScreenHeight;
  }

  /// 是否是平板
  static bool isTablet(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final diagonal = _calculateDiagonal(size.width, size.height);
    return diagonal > 1100; // 大于1100逻辑像素视为平板
  }

  /// 计算对角线长度
  static double _calculateDiagonal(double width, double height) {
    return (width * width + height * height) * 0.5;
  }

  /// 获取屏幕尺寸类型
  static ScreenSizeType getScreenSizeType(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width < 360) return ScreenSizeType.small;
    if (width < 414) return ScreenSizeType.medium;
    if (width < 600) return ScreenSizeType.large;
    return ScreenSizeType.xlarge;
  }
}

/// 屏幕尺寸类型
enum ScreenSizeType {
  small, // 小屏手机 (<360)
  medium, // 标准手机 (360-414)
  large, // 大屏手机 (414-600)
  xlarge, // 平板 (>600)
}
