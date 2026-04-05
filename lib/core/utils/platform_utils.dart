import 'dart:io';

class PlatformUtils {
  static bool get isIOS => Platform.isIOS;
  static bool get isAndroid => Platform.isAndroid;
  static bool get isMobile => Platform.isIOS || Platform.isAndroid;

  static String get platformName {
    if (isIOS) return 'iOS';
    if (isAndroid) return 'Android';
    return 'Unknown';
  }

  // Platform-specific API keys
  static String get mapsApiKey {
    if (isIOS) {
      return const String.fromEnvironment('AMAP_IOS_KEY', defaultValue: '');
    }
    if (isAndroid) {
      return const String.fromEnvironment('AMAP_ANDROID_KEY', defaultValue: '');
    }
    return '';
  }

  // Platform-specific storage paths
  static String? get documentsPath {
    // Returns platform-specific documents path
    return null;
  }

  static String? get cachePath {
    // Returns platform-specific cache path
    return null;
  }
}
