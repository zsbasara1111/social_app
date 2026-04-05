class AppConstants {
  // App Info
  static const String appName = '缘分社交';
  static const String appVersion = '1.0.0';

  // API Constants
  static const int apiTimeout = 30000; // 30 seconds
  static const int maxRetryAttempts = 3;

  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;

  // File Upload
  static const int maxImageSize = 5 * 1024 * 1024; // 5MB
  static const int maxImagesPerPost = 9;
  static const int maxPhotosPerUser = 9;

  // User Profile
  static const int minAge = 18;
  static const int maxAge = 60;
  static const int minNicknameLength = 2;
  static const int maxNicknameLength = 20;
  static const int maxBioLength = 500;

  // Match Settings
  static const int defaultMinMatchScore = 1;
  static const int maxMatchScore = 100;
  static const int defaultMinAge = 18;
  static const int defaultMaxAge = 35;

  // Chat
  static const int maxMessageLength = 500;
  static const int chatHistoryPageSize = 50;

  // Hobby Categories
  static const List<String> presetHobbyCategories = [
    '书籍',
    '音乐',
    '游戏',
    '电影',
    '剧集',
    '综艺',
    '桌游',
    '美食',
    '饮品',
    '艺术',
    '运动',
    '宠物',
    '动画',
    '漫画',
    '播客',
    '学习',
    '歌手',
    '演员',
    '艺人',
  ];

  // Cache Duration
  static const Duration cacheDuration = Duration(minutes: 5);
  static const Duration tokenRefreshThreshold = Duration(minutes: 5);
}
