import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// 通知服务类
class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();

  bool _initialized = false;

  /// 初始化通知服务
  Future<void> initialize() async {
    if (_initialized) return;

    // Android 初始化设置
    const androidSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );

    // iOS 初始化设置
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      defaultPresentAlert: true,
      defaultPresentBadge: true,
      defaultPresentSound: true,
    );

    // 初始化
    const initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _notifications.initialize(
      initSettings,
      onDidReceiveNotificationResponse: _onNotificationTapped,
    );

    _initialized = true;
    debugPrint('NotificationService initialized');
  }

  /// 请求通知权限
  Future<bool> requestPermission() async {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      final result = await _notifications
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
      return result ?? false;
    }
    // Android 13+ 需要请求权限
    if (defaultTargetPlatform == TargetPlatform.android) {
      final result = await _notifications
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.requestNotificationsPermission();
      return result ?? true; // Android 12 及以下默认返回 true
    }
    return true;
  }

  /// 显示本地通知
  Future<void> showNotification({
    required String title,
    required String body,
    String? payload,
    NotificationType type = NotificationType.general,
  }) async {
    if (!_initialized) await initialize();

    final androidDetails = AndroidNotificationDetails(
      type.channelId,
      type.channelName,
      channelDescription: type.channelDescription,
      importance: Importance.high,
      priority: Priority.high,
      showWhen: true,
      enableVibration: true,
      playSound: true,
    );

    final iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
      badgeNumber: 1,
    );

    final details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _notifications.show(
      DateTime.now().millisecond,
      title,
      body,
      details,
      payload: payload,
    );
  }

  /// 显示匹配成功通知
  Future<void> showMatchNotification({
    required String userName,
    String? userId,
  }) async {
    await showNotification(
      title: '🎉 新的匹配！',
      body: '你和 $userName 互相喜欢了，快去打个招呼吧~',
      payload: jsonEncode({'type': 'match', 'userId': userId}),
      type: NotificationType.match,
    );
  }

  /// 显示约会邀请通知
  Future<void> showDateInvitationNotification({
    required String userName,
    String? invitationId,
  }) async {
    await showNotification(
      title: '💌 约会邀请',
      body: '$userName 向你发送了约会邀请',
      payload: jsonEncode({
        'type': 'date_invitation',
        'invitationId': invitationId,
      }),
      type: NotificationType.dateInvitation,
    );
  }

  /// 显示消息通知
  Future<void> showMessageNotification({
    required String userName,
    required String message,
    String? userId,
  }) async {
    await showNotification(
      title: userName,
      body: message,
      payload: jsonEncode({'type': 'message', 'userId': userId}),
      type: NotificationType.message,
    );
  }

  /// 显示动态互动通知
  Future<void> showFeedInteractionNotification({
    required String userName,
    required String action,
    String? postId,
  }) async {
    await showNotification(
      title: '动态互动',
      body: '$userName $action了你的动态',
      payload: jsonEncode({'type': 'feed', 'postId': postId}),
      type: NotificationType.feed,
    );
  }

  /// 取消所有通知
  Future<void> cancelAllNotifications() async {
    await _notifications.cancelAll();
  }

  /// 取消特定通知
  Future<void> cancelNotification(int id) async {
    await _notifications.cancel(id);
  }

  /// 处理通知点击
  void _onNotificationTapped(NotificationResponse response) {
    final payload = response.payload;
    if (payload == null) return;

    try {
      final data = jsonDecode(payload) as Map<String, dynamic>;
      final type = data['type'] as String?;

      // 根据类型处理导航
      switch (type) {
        case 'match':
          // TODO: 导航到匹配页面
          break;
        case 'date_invitation':
          // TODO: 导航到约会邀请页面
          break;
        case 'message':
          // TODO: 导航到聊天页面
          break;
        case 'feed':
          // TODO: 导航到动态详情页面
          break;
      }
    } catch (e) {
      debugPrint('Error handling notification tap: $e');
    }
  }
}

/// 通知类型
enum NotificationType {
  general,
  match,
  dateInvitation,
  message,
  feed,
}

extension NotificationTypeExtension on NotificationType {
  String get channelId {
    switch (this) {
      case NotificationType.match:
        return 'match_channel';
      case NotificationType.dateInvitation:
        return 'date_invitation_channel';
      case NotificationType.message:
        return 'message_channel';
      case NotificationType.feed:
        return 'feed_channel';
      case NotificationType.general:
      default:
        return 'general_channel';
    }
  }

  String get channelName {
    switch (this) {
      case NotificationType.match:
        return '匹配通知';
      case NotificationType.dateInvitation:
        return '约会邀请';
      case NotificationType.message:
        return '消息通知';
      case NotificationType.feed:
        return '动态互动';
      case NotificationType.general:
      default:
        return '一般通知';
    }
  }

  String get channelDescription {
    switch (this) {
      case NotificationType.match:
        return '当您和其他用户互相喜欢时发送通知';
      case NotificationType.dateInvitation:
        return '当您收到约会邀请时发送通知';
      case NotificationType.message:
        return '当您收到新消息时发送通知';
      case NotificationType.feed:
        return '当有人互动您的动态时发送通知';
      case NotificationType.general:
      default:
        return '一般应用通知';
    }
  }
}
