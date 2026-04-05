import 'package:permission_handler/permission_handler.dart';

/// 权限管理工具类
class PermissionUtils {
  /// 检查相机权限
  static Future<bool> checkCameraPermission() async {
    final status = await Permission.camera.status;
    return status.isGranted;
  }

  /// 请求相机权限
  static Future<bool> requestCameraPermission() async {
    final status = await Permission.camera.request();
    return status.isGranted;
  }

  /// 检查相册权限
  static Future<bool> checkPhotosPermission() async {
    final status = await Permission.photos.status;
    return status.isGranted;
  }

  /// 请求相册权限
  static Future<bool> requestPhotosPermission() async {
    final status = await Permission.photos.request();
    return status.isGranted;
  }

  /// 检查存储权限（Android）
  static Future<bool> checkStoragePermission() async {
    final status = await Permission.storage.status;
    return status.isGranted;
  }

  /// 请求存储权限
  static Future<bool> requestStoragePermission() async {
    final status = await Permission.storage.request();
    return status.isGranted;
  }

  /// 检查定位权限
  static Future<bool> checkLocationPermission() async {
    final status = await Permission.location.status;
    return status.isGranted;
  }

  /// 请求定位权限
  static Future<bool> requestLocationPermission() async {
    final status = await Permission.location.request();
    return status.isGranted;
  }

  /// 检查定位始终权限
  static Future<bool> checkLocationAlwaysPermission() async {
    final status = await Permission.locationAlways.status;
    return status.isGranted;
  }

  /// 请求定位始终权限
  static Future<bool> requestLocationAlwaysPermission() async {
    final status = await Permission.locationAlways.request();
    return status.isGranted;
  }

  /// 检查通知权限
  static Future<bool> checkNotificationPermission() async {
    final status = await Permission.notification.status;
    return status.isGranted;
  }

  /// 请求通知权限
  static Future<bool> requestNotificationPermission() async {
    final status = await Permission.notification.request();
    return status.isGranted;
  }

  /// 检查麦克风权限
  static Future<bool> checkMicrophonePermission() async {
    final status = await Permission.microphone.status;
    return status.isGranted;
  }

  /// 请求麦克风权限
  static Future<bool> requestMicrophonePermission() async {
    final status = await Permission.microphone.request();
    return status.isGranted;
  }

  /// 检查所有必要权限
  static Future<Map<Permission, bool>> checkAllPermissions() async {
    return {
      Permission.camera: await checkCameraPermission(),
      Permission.photos: await checkPhotosPermission(),
      Permission.location: await checkLocationPermission(),
      Permission.notification: await checkNotificationPermission(),
    };
  }

  /// 打开应用设置
  static Future<void> openAppSettings() async {
    await openAppSettings();
  }
}

/// 权限类型枚举
enum AppPermission {
  camera,
  photos,
  storage,
  location,
  locationAlways,
  notification,
  microphone,
}

/// 权限结果
class PermissionResult {
  final bool isGranted;
  final bool isPermanentlyDenied;
  final bool isLimited;
  final bool isRestricted;

  const PermissionResult({
    required this.isGranted,
    this.isPermanentlyDenied = false,
    this.isLimited = false,
    this.isRestricted = false,
  });

  factory PermissionResult.fromStatus(PermissionStatus status) {
    return PermissionResult(
      isGranted: status.isGranted,
      isPermanentlyDenied: status.isPermanentlyDenied,
      isLimited: status.isLimited,
      isRestricted: status.isRestricted,
    );
  }
}
