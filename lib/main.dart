import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:firebase_core/firebase_core.dart';

import 'core/services/notification_service.dart';
import 'core/theme/app_theme.dart';
import 'core/utils/performance_utils.dart';
import 'core/utils/platform_utils.dart';
import 'core/widgets/desktop_layout.dart';
import 'config/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 锁定竖屏
  PlatformUtils.lockPortrait();

  // 设置状态栏样式
  PlatformUtils.setSystemUIOverlayStyle(
    statusBarBrightness: Brightness.light,
  );

  // 初始化通知服务
  await NotificationService().initialize();

  // 配置图片缓存
  ImageCacheManager().setCacheSize(
    maxSize: 1000,
    maxSizeBytes: 100 * 1024 * 1024, // 100MB
  );

  // Load environment variables
  // await dotenv.load(fileName: ".env");

  // Initialize Firebase (disabled for Windows desktop)
  // await Firebase.initializeApp();

  // Initialize Supabase (disabled for demo)
  // await Supabase.initialize(
  //   url: dotenv.env['SUPABASE_URL']!,
  //   anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  // );

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    // 开始内存监控（仅在Debug模式）
    if (!const bool.fromEnvironment('dart.vm.product')) {
      PerformanceUtils().startMemoryMonitoring();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    PerformanceUtils().dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    switch (state) {
      case AppLifecycleState.paused:
        // 应用进入后台，清理资源
        ImageCacheManager().clearCache();
        break;
      case AppLifecycleState.resumed:
        // 应用回到前台
        break;
      case AppLifecycleState.inactive:
        // 应用变为非活动状态
        break;
      case AppLifecycleState.detached:
        // 应用被分离
        break;
      case AppLifecycleState.hidden:
        // 应用被隐藏
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: '缘分社交',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          routerConfig: router,
          builder: (context, child) {
            // 桌面端使用模拟手机界面
            return ResponsiveLayout(
              mobile: child ?? const SizedBox.shrink(),
            );
          },
        );
      },
    );
  }
}
