import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 桌面端布局包装器
/// 按比例缩放模拟移动设备界面，全屏显示无需滚动
class DesktopLayout extends StatelessWidget {
  final Widget child;
  final bool showFrame;
  final String? title;

  const DesktopLayout({
    super.key,
    required this.child,
    this.showFrame = true,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    // 在桌面端限制宽度，模拟手机界面
    if (!_isDesktop(context)) {
      return child;
    }

    return Scaffold(
      backgroundColor: const Color(0xFF1a1a2e),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // 手机设计尺寸
          const phoneWidth = 393.0;
          const phoneHeight = 852.0;

          // 计算可用空间（留边距）
          final availableWidth = constraints.maxWidth - 40;
          final availableHeight = constraints.maxHeight - 40;

          // 计算缩放比例，保持纵横比
          final scaleX = availableWidth / phoneWidth;
          final scaleY = availableHeight / phoneHeight;
          final scale = scaleX < scaleY ? scaleX : scaleY;

          // 限制最大缩放（避免在大屏上过度放大）
          final finalScale = scale > 1.2 ? 1.2 : scale;

          return Center(
            child: Transform.scale(
              scale: finalScale,
              child: Container(
                width: phoneWidth,
                height: phoneHeight,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.3),
                      blurRadius: 40,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Column(
                    children: [
                      // 模拟手机顶部状态栏（刘海屏）
                      if (showFrame)
                        Container(
                          height: 44,
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 120,
                                height: 35,
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(18),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    title ?? '缘分社交',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      // 内容区域
                      Expanded(
                        child: MediaQuery(
                          // 覆盖 MediaQuery 使 ScreenUtil 正确计算
                          data: MediaQuery.of(context).copyWith(
                            size: const Size(phoneWidth, phoneHeight - 78),
                            padding: EdgeInsets.zero,
                            viewPadding: EdgeInsets.zero,
                            viewInsets: EdgeInsets.zero,
                          ),
                          child: child,
                        ),
                      ),
                      // 模拟底部指示条
                      if (showFrame)
                        Container(
                          height: 34,
                          color: Colors.white,
                          child: Center(
                            child: Container(
                              width: 134,
                              height: 5,
                              decoration: BoxDecoration(
                                color: Colors.black.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  bool _isDesktop(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    // 如果屏幕尺寸明显大于手机尺寸，认为是桌面端
    return width > 600 || height > 1000;
  }
}

/// 响应式布局包装器
/// 根据屏幕尺寸自动选择布局方式
class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  const ResponsiveLayout({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final shortestSide = size.shortestSide;

    // 根据最短边判断设备类型
    if (shortestSide < 600) {
      // 手机 - 直接显示
      return mobile;
    } else if (shortestSide < 900) {
      // 平板 - 居中显示，限制最大宽度
      return tablet ?? _buildTabletLayout(context);
    } else {
      // 桌面端 - 缩放模拟手机界面
      return desktop ?? _buildDesktopLayout(context);
    }
  }

  Widget _buildTabletLayout(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600),
        child: mobile,
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return DesktopLayout(
      child: mobile,
    );
  }
}

/// 内容最大宽度限制器
/// 用于限制内容在宽屏幕上的显示宽度
class MaxWidthContainer extends StatelessWidget {
  final Widget child;
  final double maxWidth;

  const MaxWidthContainer({
    super.key,
    required this.child,
    this.maxWidth = 480,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth.w),
        child: child,
      ),
    );
  }
}
