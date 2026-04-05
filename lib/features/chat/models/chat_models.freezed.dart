// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) {
  return _ChatMessage.fromJson(json);
}

/// @nodoc
mixin _$ChatMessage {
  String get id => throw _privateConstructorUsedError;
  String get senderId => throw _privateConstructorUsedError;
  String get receiverId => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  bool get isRead => throw _privateConstructorUsedError;
  DateTime? get readAt => throw _privateConstructorUsedError;
  String? get type =>
      throw _privateConstructorUsedError; // text, image, invitation
  ChatInvitation? get invitation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatMessageCopyWith<ChatMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatMessageCopyWith<$Res> {
  factory $ChatMessageCopyWith(
          ChatMessage value, $Res Function(ChatMessage) then) =
      _$ChatMessageCopyWithImpl<$Res, ChatMessage>;
  @useResult
  $Res call(
      {String id,
      String senderId,
      String receiverId,
      String content,
      DateTime createdAt,
      bool isRead,
      DateTime? readAt,
      String? type,
      ChatInvitation? invitation});

  $ChatInvitationCopyWith<$Res>? get invitation;
}

/// @nodoc
class _$ChatMessageCopyWithImpl<$Res, $Val extends ChatMessage>
    implements $ChatMessageCopyWith<$Res> {
  _$ChatMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? senderId = null,
    Object? receiverId = null,
    Object? content = null,
    Object? createdAt = null,
    Object? isRead = null,
    Object? readAt = freezed,
    Object? type = freezed,
    Object? invitation = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      receiverId: null == receiverId
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      readAt: freezed == readAt
          ? _value.readAt
          : readAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      invitation: freezed == invitation
          ? _value.invitation
          : invitation // ignore: cast_nullable_to_non_nullable
              as ChatInvitation?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ChatInvitationCopyWith<$Res>? get invitation {
    if (_value.invitation == null) {
      return null;
    }

    return $ChatInvitationCopyWith<$Res>(_value.invitation!, (value) {
      return _then(_value.copyWith(invitation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChatMessageImplCopyWith<$Res>
    implements $ChatMessageCopyWith<$Res> {
  factory _$$ChatMessageImplCopyWith(
          _$ChatMessageImpl value, $Res Function(_$ChatMessageImpl) then) =
      __$$ChatMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String senderId,
      String receiverId,
      String content,
      DateTime createdAt,
      bool isRead,
      DateTime? readAt,
      String? type,
      ChatInvitation? invitation});

  @override
  $ChatInvitationCopyWith<$Res>? get invitation;
}

/// @nodoc
class __$$ChatMessageImplCopyWithImpl<$Res>
    extends _$ChatMessageCopyWithImpl<$Res, _$ChatMessageImpl>
    implements _$$ChatMessageImplCopyWith<$Res> {
  __$$ChatMessageImplCopyWithImpl(
      _$ChatMessageImpl _value, $Res Function(_$ChatMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? senderId = null,
    Object? receiverId = null,
    Object? content = null,
    Object? createdAt = null,
    Object? isRead = null,
    Object? readAt = freezed,
    Object? type = freezed,
    Object? invitation = freezed,
  }) {
    return _then(_$ChatMessageImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      receiverId: null == receiverId
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      readAt: freezed == readAt
          ? _value.readAt
          : readAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      invitation: freezed == invitation
          ? _value.invitation
          : invitation // ignore: cast_nullable_to_non_nullable
              as ChatInvitation?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatMessageImpl implements _ChatMessage {
  const _$ChatMessageImpl(
      {required this.id,
      required this.senderId,
      required this.receiverId,
      required this.content,
      required this.createdAt,
      this.isRead = false,
      this.readAt,
      this.type,
      this.invitation});

  factory _$ChatMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatMessageImplFromJson(json);

  @override
  final String id;
  @override
  final String senderId;
  @override
  final String receiverId;
  @override
  final String content;
  @override
  final DateTime createdAt;
  @override
  @JsonKey()
  final bool isRead;
  @override
  final DateTime? readAt;
  @override
  final String? type;
// text, image, invitation
  @override
  final ChatInvitation? invitation;

  @override
  String toString() {
    return 'ChatMessage(id: $id, senderId: $senderId, receiverId: $receiverId, content: $content, createdAt: $createdAt, isRead: $isRead, readAt: $readAt, type: $type, invitation: $invitation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatMessageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.receiverId, receiverId) ||
                other.receiverId == receiverId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
            (identical(other.readAt, readAt) || other.readAt == readAt) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.invitation, invitation) ||
                other.invitation == invitation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, senderId, receiverId,
      content, createdAt, isRead, readAt, type, invitation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatMessageImplCopyWith<_$ChatMessageImpl> get copyWith =>
      __$$ChatMessageImplCopyWithImpl<_$ChatMessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatMessageImplToJson(
      this,
    );
  }
}

abstract class _ChatMessage implements ChatMessage {
  const factory _ChatMessage(
      {required final String id,
      required final String senderId,
      required final String receiverId,
      required final String content,
      required final DateTime createdAt,
      final bool isRead,
      final DateTime? readAt,
      final String? type,
      final ChatInvitation? invitation}) = _$ChatMessageImpl;

  factory _ChatMessage.fromJson(Map<String, dynamic> json) =
      _$ChatMessageImpl.fromJson;

  @override
  String get id;
  @override
  String get senderId;
  @override
  String get receiverId;
  @override
  String get content;
  @override
  DateTime get createdAt;
  @override
  bool get isRead;
  @override
  DateTime? get readAt;
  @override
  String? get type;
  @override // text, image, invitation
  ChatInvitation? get invitation;
  @override
  @JsonKey(ignore: true)
  _$$ChatMessageImplCopyWith<_$ChatMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChatConversation _$ChatConversationFromJson(Map<String, dynamic> json) {
  return _ChatConversation.fromJson(json);
}

/// @nodoc
mixin _$ChatConversation {
  String get id => throw _privateConstructorUsedError;
  String get otherUserId => throw _privateConstructorUsedError;
  String get otherUserNickname => throw _privateConstructorUsedError;
  String? get otherUserAvatar => throw _privateConstructorUsedError;
  String? get lastMessage => throw _privateConstructorUsedError;
  DateTime? get lastMessageTime => throw _privateConstructorUsedError;
  int get unreadCount => throw _privateConstructorUsedError;
  bool get hasMutualHeart => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatConversationCopyWith<ChatConversation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatConversationCopyWith<$Res> {
  factory $ChatConversationCopyWith(
          ChatConversation value, $Res Function(ChatConversation) then) =
      _$ChatConversationCopyWithImpl<$Res, ChatConversation>;
  @useResult
  $Res call(
      {String id,
      String otherUserId,
      String otherUserNickname,
      String? otherUserAvatar,
      String? lastMessage,
      DateTime? lastMessageTime,
      int unreadCount,
      bool hasMutualHeart});
}

/// @nodoc
class _$ChatConversationCopyWithImpl<$Res, $Val extends ChatConversation>
    implements $ChatConversationCopyWith<$Res> {
  _$ChatConversationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? otherUserId = null,
    Object? otherUserNickname = null,
    Object? otherUserAvatar = freezed,
    Object? lastMessage = freezed,
    Object? lastMessageTime = freezed,
    Object? unreadCount = null,
    Object? hasMutualHeart = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      otherUserId: null == otherUserId
          ? _value.otherUserId
          : otherUserId // ignore: cast_nullable_to_non_nullable
              as String,
      otherUserNickname: null == otherUserNickname
          ? _value.otherUserNickname
          : otherUserNickname // ignore: cast_nullable_to_non_nullable
              as String,
      otherUserAvatar: freezed == otherUserAvatar
          ? _value.otherUserAvatar
          : otherUserAvatar // ignore: cast_nullable_to_non_nullable
              as String?,
      lastMessage: freezed == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      lastMessageTime: freezed == lastMessageTime
          ? _value.lastMessageTime
          : lastMessageTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      unreadCount: null == unreadCount
          ? _value.unreadCount
          : unreadCount // ignore: cast_nullable_to_non_nullable
              as int,
      hasMutualHeart: null == hasMutualHeart
          ? _value.hasMutualHeart
          : hasMutualHeart // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatConversationImplCopyWith<$Res>
    implements $ChatConversationCopyWith<$Res> {
  factory _$$ChatConversationImplCopyWith(_$ChatConversationImpl value,
          $Res Function(_$ChatConversationImpl) then) =
      __$$ChatConversationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String otherUserId,
      String otherUserNickname,
      String? otherUserAvatar,
      String? lastMessage,
      DateTime? lastMessageTime,
      int unreadCount,
      bool hasMutualHeart});
}

/// @nodoc
class __$$ChatConversationImplCopyWithImpl<$Res>
    extends _$ChatConversationCopyWithImpl<$Res, _$ChatConversationImpl>
    implements _$$ChatConversationImplCopyWith<$Res> {
  __$$ChatConversationImplCopyWithImpl(_$ChatConversationImpl _value,
      $Res Function(_$ChatConversationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? otherUserId = null,
    Object? otherUserNickname = null,
    Object? otherUserAvatar = freezed,
    Object? lastMessage = freezed,
    Object? lastMessageTime = freezed,
    Object? unreadCount = null,
    Object? hasMutualHeart = null,
  }) {
    return _then(_$ChatConversationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      otherUserId: null == otherUserId
          ? _value.otherUserId
          : otherUserId // ignore: cast_nullable_to_non_nullable
              as String,
      otherUserNickname: null == otherUserNickname
          ? _value.otherUserNickname
          : otherUserNickname // ignore: cast_nullable_to_non_nullable
              as String,
      otherUserAvatar: freezed == otherUserAvatar
          ? _value.otherUserAvatar
          : otherUserAvatar // ignore: cast_nullable_to_non_nullable
              as String?,
      lastMessage: freezed == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      lastMessageTime: freezed == lastMessageTime
          ? _value.lastMessageTime
          : lastMessageTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      unreadCount: null == unreadCount
          ? _value.unreadCount
          : unreadCount // ignore: cast_nullable_to_non_nullable
              as int,
      hasMutualHeart: null == hasMutualHeart
          ? _value.hasMutualHeart
          : hasMutualHeart // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatConversationImpl implements _ChatConversation {
  const _$ChatConversationImpl(
      {required this.id,
      required this.otherUserId,
      required this.otherUserNickname,
      this.otherUserAvatar,
      this.lastMessage,
      this.lastMessageTime,
      this.unreadCount = 0,
      this.hasMutualHeart = false});

  factory _$ChatConversationImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatConversationImplFromJson(json);

  @override
  final String id;
  @override
  final String otherUserId;
  @override
  final String otherUserNickname;
  @override
  final String? otherUserAvatar;
  @override
  final String? lastMessage;
  @override
  final DateTime? lastMessageTime;
  @override
  @JsonKey()
  final int unreadCount;
  @override
  @JsonKey()
  final bool hasMutualHeart;

  @override
  String toString() {
    return 'ChatConversation(id: $id, otherUserId: $otherUserId, otherUserNickname: $otherUserNickname, otherUserAvatar: $otherUserAvatar, lastMessage: $lastMessage, lastMessageTime: $lastMessageTime, unreadCount: $unreadCount, hasMutualHeart: $hasMutualHeart)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatConversationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.otherUserId, otherUserId) ||
                other.otherUserId == otherUserId) &&
            (identical(other.otherUserNickname, otherUserNickname) ||
                other.otherUserNickname == otherUserNickname) &&
            (identical(other.otherUserAvatar, otherUserAvatar) ||
                other.otherUserAvatar == otherUserAvatar) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage) &&
            (identical(other.lastMessageTime, lastMessageTime) ||
                other.lastMessageTime == lastMessageTime) &&
            (identical(other.unreadCount, unreadCount) ||
                other.unreadCount == unreadCount) &&
            (identical(other.hasMutualHeart, hasMutualHeart) ||
                other.hasMutualHeart == hasMutualHeart));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      otherUserId,
      otherUserNickname,
      otherUserAvatar,
      lastMessage,
      lastMessageTime,
      unreadCount,
      hasMutualHeart);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatConversationImplCopyWith<_$ChatConversationImpl> get copyWith =>
      __$$ChatConversationImplCopyWithImpl<_$ChatConversationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatConversationImplToJson(
      this,
    );
  }
}

abstract class _ChatConversation implements ChatConversation {
  const factory _ChatConversation(
      {required final String id,
      required final String otherUserId,
      required final String otherUserNickname,
      final String? otherUserAvatar,
      final String? lastMessage,
      final DateTime? lastMessageTime,
      final int unreadCount,
      final bool hasMutualHeart}) = _$ChatConversationImpl;

  factory _ChatConversation.fromJson(Map<String, dynamic> json) =
      _$ChatConversationImpl.fromJson;

  @override
  String get id;
  @override
  String get otherUserId;
  @override
  String get otherUserNickname;
  @override
  String? get otherUserAvatar;
  @override
  String? get lastMessage;
  @override
  DateTime? get lastMessageTime;
  @override
  int get unreadCount;
  @override
  bool get hasMutualHeart;
  @override
  @JsonKey(ignore: true)
  _$$ChatConversationImplCopyWith<_$ChatConversationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChatInvitation _$ChatInvitationFromJson(Map<String, dynamic> json) {
  return _ChatInvitation.fromJson(json);
}

/// @nodoc
mixin _$ChatInvitation {
  String get id => throw _privateConstructorUsedError;
  String get senderId => throw _privateConstructorUsedError;
  String get receiverId => throw _privateConstructorUsedError;
  String get status =>
      throw _privateConstructorUsedError; // pending, accepted, declined
  String? get message => throw _privateConstructorUsedError;
  DateTime? get proposedTime => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get respondedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatInvitationCopyWith<ChatInvitation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatInvitationCopyWith<$Res> {
  factory $ChatInvitationCopyWith(
          ChatInvitation value, $Res Function(ChatInvitation) then) =
      _$ChatInvitationCopyWithImpl<$Res, ChatInvitation>;
  @useResult
  $Res call(
      {String id,
      String senderId,
      String receiverId,
      String status,
      String? message,
      DateTime? proposedTime,
      String? location,
      DateTime? createdAt,
      DateTime? respondedAt});
}

/// @nodoc
class _$ChatInvitationCopyWithImpl<$Res, $Val extends ChatInvitation>
    implements $ChatInvitationCopyWith<$Res> {
  _$ChatInvitationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? senderId = null,
    Object? receiverId = null,
    Object? status = null,
    Object? message = freezed,
    Object? proposedTime = freezed,
    Object? location = freezed,
    Object? createdAt = freezed,
    Object? respondedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      receiverId: null == receiverId
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      proposedTime: freezed == proposedTime
          ? _value.proposedTime
          : proposedTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      respondedAt: freezed == respondedAt
          ? _value.respondedAt
          : respondedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatInvitationImplCopyWith<$Res>
    implements $ChatInvitationCopyWith<$Res> {
  factory _$$ChatInvitationImplCopyWith(_$ChatInvitationImpl value,
          $Res Function(_$ChatInvitationImpl) then) =
      __$$ChatInvitationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String senderId,
      String receiverId,
      String status,
      String? message,
      DateTime? proposedTime,
      String? location,
      DateTime? createdAt,
      DateTime? respondedAt});
}

/// @nodoc
class __$$ChatInvitationImplCopyWithImpl<$Res>
    extends _$ChatInvitationCopyWithImpl<$Res, _$ChatInvitationImpl>
    implements _$$ChatInvitationImplCopyWith<$Res> {
  __$$ChatInvitationImplCopyWithImpl(
      _$ChatInvitationImpl _value, $Res Function(_$ChatInvitationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? senderId = null,
    Object? receiverId = null,
    Object? status = null,
    Object? message = freezed,
    Object? proposedTime = freezed,
    Object? location = freezed,
    Object? createdAt = freezed,
    Object? respondedAt = freezed,
  }) {
    return _then(_$ChatInvitationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      receiverId: null == receiverId
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      proposedTime: freezed == proposedTime
          ? _value.proposedTime
          : proposedTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      respondedAt: freezed == respondedAt
          ? _value.respondedAt
          : respondedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatInvitationImpl implements _ChatInvitation {
  const _$ChatInvitationImpl(
      {required this.id,
      required this.senderId,
      required this.receiverId,
      this.status = 'pending',
      this.message,
      this.proposedTime,
      this.location,
      this.createdAt,
      this.respondedAt});

  factory _$ChatInvitationImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatInvitationImplFromJson(json);

  @override
  final String id;
  @override
  final String senderId;
  @override
  final String receiverId;
  @override
  @JsonKey()
  final String status;
// pending, accepted, declined
  @override
  final String? message;
  @override
  final DateTime? proposedTime;
  @override
  final String? location;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? respondedAt;

  @override
  String toString() {
    return 'ChatInvitation(id: $id, senderId: $senderId, receiverId: $receiverId, status: $status, message: $message, proposedTime: $proposedTime, location: $location, createdAt: $createdAt, respondedAt: $respondedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatInvitationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.receiverId, receiverId) ||
                other.receiverId == receiverId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.proposedTime, proposedTime) ||
                other.proposedTime == proposedTime) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.respondedAt, respondedAt) ||
                other.respondedAt == respondedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, senderId, receiverId, status,
      message, proposedTime, location, createdAt, respondedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatInvitationImplCopyWith<_$ChatInvitationImpl> get copyWith =>
      __$$ChatInvitationImplCopyWithImpl<_$ChatInvitationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatInvitationImplToJson(
      this,
    );
  }
}

abstract class _ChatInvitation implements ChatInvitation {
  const factory _ChatInvitation(
      {required final String id,
      required final String senderId,
      required final String receiverId,
      final String status,
      final String? message,
      final DateTime? proposedTime,
      final String? location,
      final DateTime? createdAt,
      final DateTime? respondedAt}) = _$ChatInvitationImpl;

  factory _ChatInvitation.fromJson(Map<String, dynamic> json) =
      _$ChatInvitationImpl.fromJson;

  @override
  String get id;
  @override
  String get senderId;
  @override
  String get receiverId;
  @override
  String get status;
  @override // pending, accepted, declined
  String? get message;
  @override
  DateTime? get proposedTime;
  @override
  String? get location;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get respondedAt;
  @override
  @JsonKey(ignore: true)
  _$$ChatInvitationImplCopyWith<_$ChatInvitationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ChatState {
  List<ChatMessage> get messages => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSending => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  bool get hasMore => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatStateCopyWith<ChatState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatStateCopyWith<$Res> {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) then) =
      _$ChatStateCopyWithImpl<$Res, ChatState>;
  @useResult
  $Res call(
      {List<ChatMessage> messages,
      bool isLoading,
      bool isSending,
      String? error,
      bool hasMore});
}

/// @nodoc
class _$ChatStateCopyWithImpl<$Res, $Val extends ChatState>
    implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
    Object? isLoading = null,
    Object? isSending = null,
    Object? error = freezed,
    Object? hasMore = null,
  }) {
    return _then(_value.copyWith(
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<ChatMessage>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSending: null == isSending
          ? _value.isSending
          : isSending // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatStateImplCopyWith<$Res>
    implements $ChatStateCopyWith<$Res> {
  factory _$$ChatStateImplCopyWith(
          _$ChatStateImpl value, $Res Function(_$ChatStateImpl) then) =
      __$$ChatStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ChatMessage> messages,
      bool isLoading,
      bool isSending,
      String? error,
      bool hasMore});
}

/// @nodoc
class __$$ChatStateImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$ChatStateImpl>
    implements _$$ChatStateImplCopyWith<$Res> {
  __$$ChatStateImplCopyWithImpl(
      _$ChatStateImpl _value, $Res Function(_$ChatStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
    Object? isLoading = null,
    Object? isSending = null,
    Object? error = freezed,
    Object? hasMore = null,
  }) {
    return _then(_$ChatStateImpl(
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<ChatMessage>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSending: null == isSending
          ? _value.isSending
          : isSending // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ChatStateImpl implements _ChatState {
  const _$ChatStateImpl(
      {final List<ChatMessage> messages = const [],
      this.isLoading = false,
      this.isSending = false,
      this.error,
      this.hasMore = false})
      : _messages = messages;

  final List<ChatMessage> _messages;
  @override
  @JsonKey()
  List<ChatMessage> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isSending;
  @override
  final String? error;
  @override
  @JsonKey()
  final bool hasMore;

  @override
  String toString() {
    return 'ChatState(messages: $messages, isLoading: $isLoading, isSending: $isSending, error: $error, hasMore: $hasMore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatStateImpl &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSending, isSending) ||
                other.isSending == isSending) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_messages),
      isLoading,
      isSending,
      error,
      hasMore);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatStateImplCopyWith<_$ChatStateImpl> get copyWith =>
      __$$ChatStateImplCopyWithImpl<_$ChatStateImpl>(this, _$identity);
}

abstract class _ChatState implements ChatState {
  const factory _ChatState(
      {final List<ChatMessage> messages,
      final bool isLoading,
      final bool isSending,
      final String? error,
      final bool hasMore}) = _$ChatStateImpl;

  @override
  List<ChatMessage> get messages;
  @override
  bool get isLoading;
  @override
  bool get isSending;
  @override
  String? get error;
  @override
  bool get hasMore;
  @override
  @JsonKey(ignore: true)
  _$$ChatStateImplCopyWith<_$ChatStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ConversationState {
  List<ChatConversation> get conversations =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConversationStateCopyWith<ConversationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversationStateCopyWith<$Res> {
  factory $ConversationStateCopyWith(
          ConversationState value, $Res Function(ConversationState) then) =
      _$ConversationStateCopyWithImpl<$Res, ConversationState>;
  @useResult
  $Res call(
      {List<ChatConversation> conversations, bool isLoading, String? error});
}

/// @nodoc
class _$ConversationStateCopyWithImpl<$Res, $Val extends ConversationState>
    implements $ConversationStateCopyWith<$Res> {
  _$ConversationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conversations = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      conversations: null == conversations
          ? _value.conversations
          : conversations // ignore: cast_nullable_to_non_nullable
              as List<ChatConversation>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConversationStateImplCopyWith<$Res>
    implements $ConversationStateCopyWith<$Res> {
  factory _$$ConversationStateImplCopyWith(_$ConversationStateImpl value,
          $Res Function(_$ConversationStateImpl) then) =
      __$$ConversationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ChatConversation> conversations, bool isLoading, String? error});
}

/// @nodoc
class __$$ConversationStateImplCopyWithImpl<$Res>
    extends _$ConversationStateCopyWithImpl<$Res, _$ConversationStateImpl>
    implements _$$ConversationStateImplCopyWith<$Res> {
  __$$ConversationStateImplCopyWithImpl(_$ConversationStateImpl _value,
      $Res Function(_$ConversationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conversations = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_$ConversationStateImpl(
      conversations: null == conversations
          ? _value._conversations
          : conversations // ignore: cast_nullable_to_non_nullable
              as List<ChatConversation>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ConversationStateImpl implements _ConversationState {
  const _$ConversationStateImpl(
      {final List<ChatConversation> conversations = const [],
      this.isLoading = false,
      this.error})
      : _conversations = conversations;

  final List<ChatConversation> _conversations;
  @override
  @JsonKey()
  List<ChatConversation> get conversations {
    if (_conversations is EqualUnmodifiableListView) return _conversations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_conversations);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? error;

  @override
  String toString() {
    return 'ConversationState(conversations: $conversations, isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConversationStateImpl &&
            const DeepCollectionEquality()
                .equals(other._conversations, _conversations) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_conversations), isLoading, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConversationStateImplCopyWith<_$ConversationStateImpl> get copyWith =>
      __$$ConversationStateImplCopyWithImpl<_$ConversationStateImpl>(
          this, _$identity);
}

abstract class _ConversationState implements ConversationState {
  const factory _ConversationState(
      {final List<ChatConversation> conversations,
      final bool isLoading,
      final String? error}) = _$ConversationStateImpl;

  @override
  List<ChatConversation> get conversations;
  @override
  bool get isLoading;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$ConversationStateImplCopyWith<_$ConversationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
