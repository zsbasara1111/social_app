// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'heart_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HeartRecord _$HeartRecordFromJson(Map<String, dynamic> json) {
  return _HeartRecord.fromJson(json);
}

/// @nodoc
mixin _$HeartRecord {
  String get id => throw _privateConstructorUsedError;
  String get senderId => throw _privateConstructorUsedError;
  String get receiverId => throw _privateConstructorUsedError;
  bool get isMutual => throw _privateConstructorUsedError;
  DateTime? get mutualAt => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HeartRecordCopyWith<HeartRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HeartRecordCopyWith<$Res> {
  factory $HeartRecordCopyWith(
          HeartRecord value, $Res Function(HeartRecord) then) =
      _$HeartRecordCopyWithImpl<$Res, HeartRecord>;
  @useResult
  $Res call(
      {String id,
      String senderId,
      String receiverId,
      bool isMutual,
      DateTime? mutualAt,
      DateTime? createdAt});
}

/// @nodoc
class _$HeartRecordCopyWithImpl<$Res, $Val extends HeartRecord>
    implements $HeartRecordCopyWith<$Res> {
  _$HeartRecordCopyWithImpl(this._value, this._then);

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
    Object? isMutual = null,
    Object? mutualAt = freezed,
    Object? createdAt = freezed,
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
      isMutual: null == isMutual
          ? _value.isMutual
          : isMutual // ignore: cast_nullable_to_non_nullable
              as bool,
      mutualAt: freezed == mutualAt
          ? _value.mutualAt
          : mutualAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HeartRecordImplCopyWith<$Res>
    implements $HeartRecordCopyWith<$Res> {
  factory _$$HeartRecordImplCopyWith(
          _$HeartRecordImpl value, $Res Function(_$HeartRecordImpl) then) =
      __$$HeartRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String senderId,
      String receiverId,
      bool isMutual,
      DateTime? mutualAt,
      DateTime? createdAt});
}

/// @nodoc
class __$$HeartRecordImplCopyWithImpl<$Res>
    extends _$HeartRecordCopyWithImpl<$Res, _$HeartRecordImpl>
    implements _$$HeartRecordImplCopyWith<$Res> {
  __$$HeartRecordImplCopyWithImpl(
      _$HeartRecordImpl _value, $Res Function(_$HeartRecordImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? senderId = null,
    Object? receiverId = null,
    Object? isMutual = null,
    Object? mutualAt = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$HeartRecordImpl(
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
      isMutual: null == isMutual
          ? _value.isMutual
          : isMutual // ignore: cast_nullable_to_non_nullable
              as bool,
      mutualAt: freezed == mutualAt
          ? _value.mutualAt
          : mutualAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HeartRecordImpl implements _HeartRecord {
  const _$HeartRecordImpl(
      {required this.id,
      required this.senderId,
      required this.receiverId,
      this.isMutual = false,
      this.mutualAt,
      this.createdAt});

  factory _$HeartRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$HeartRecordImplFromJson(json);

  @override
  final String id;
  @override
  final String senderId;
  @override
  final String receiverId;
  @override
  @JsonKey()
  final bool isMutual;
  @override
  final DateTime? mutualAt;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'HeartRecord(id: $id, senderId: $senderId, receiverId: $receiverId, isMutual: $isMutual, mutualAt: $mutualAt, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HeartRecordImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.receiverId, receiverId) ||
                other.receiverId == receiverId) &&
            (identical(other.isMutual, isMutual) ||
                other.isMutual == isMutual) &&
            (identical(other.mutualAt, mutualAt) ||
                other.mutualAt == mutualAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, senderId, receiverId, isMutual, mutualAt, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HeartRecordImplCopyWith<_$HeartRecordImpl> get copyWith =>
      __$$HeartRecordImplCopyWithImpl<_$HeartRecordImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HeartRecordImplToJson(
      this,
    );
  }
}

abstract class _HeartRecord implements HeartRecord {
  const factory _HeartRecord(
      {required final String id,
      required final String senderId,
      required final String receiverId,
      final bool isMutual,
      final DateTime? mutualAt,
      final DateTime? createdAt}) = _$HeartRecordImpl;

  factory _HeartRecord.fromJson(Map<String, dynamic> json) =
      _$HeartRecordImpl.fromJson;

  @override
  String get id;
  @override
  String get senderId;
  @override
  String get receiverId;
  @override
  bool get isMutual;
  @override
  DateTime? get mutualAt;
  @override
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$HeartRecordImplCopyWith<_$HeartRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HeartState {
  HeartStatus get status => throw _privateConstructorUsedError;
  HeartRecord? get record => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HeartStateCopyWith<HeartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HeartStateCopyWith<$Res> {
  factory $HeartStateCopyWith(
          HeartState value, $Res Function(HeartState) then) =
      _$HeartStateCopyWithImpl<$Res, HeartState>;
  @useResult
  $Res call(
      {HeartStatus status, HeartRecord? record, bool isLoading, String? error});

  $HeartRecordCopyWith<$Res>? get record;
}

/// @nodoc
class _$HeartStateCopyWithImpl<$Res, $Val extends HeartState>
    implements $HeartStateCopyWith<$Res> {
  _$HeartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? record = freezed,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as HeartStatus,
      record: freezed == record
          ? _value.record
          : record // ignore: cast_nullable_to_non_nullable
              as HeartRecord?,
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

  @override
  @pragma('vm:prefer-inline')
  $HeartRecordCopyWith<$Res>? get record {
    if (_value.record == null) {
      return null;
    }

    return $HeartRecordCopyWith<$Res>(_value.record!, (value) {
      return _then(_value.copyWith(record: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HeartStateImplCopyWith<$Res>
    implements $HeartStateCopyWith<$Res> {
  factory _$$HeartStateImplCopyWith(
          _$HeartStateImpl value, $Res Function(_$HeartStateImpl) then) =
      __$$HeartStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {HeartStatus status, HeartRecord? record, bool isLoading, String? error});

  @override
  $HeartRecordCopyWith<$Res>? get record;
}

/// @nodoc
class __$$HeartStateImplCopyWithImpl<$Res>
    extends _$HeartStateCopyWithImpl<$Res, _$HeartStateImpl>
    implements _$$HeartStateImplCopyWith<$Res> {
  __$$HeartStateImplCopyWithImpl(
      _$HeartStateImpl _value, $Res Function(_$HeartStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? record = freezed,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_$HeartStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as HeartStatus,
      record: freezed == record
          ? _value.record
          : record // ignore: cast_nullable_to_non_nullable
              as HeartRecord?,
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

class _$HeartStateImpl implements _HeartState {
  const _$HeartStateImpl(
      {this.status = HeartStatus.none,
      this.record,
      this.isLoading = false,
      this.error});

  @override
  @JsonKey()
  final HeartStatus status;
  @override
  final HeartRecord? record;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? error;

  @override
  String toString() {
    return 'HeartState(status: $status, record: $record, isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HeartStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.record, record) || other.record == record) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, record, isLoading, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HeartStateImplCopyWith<_$HeartStateImpl> get copyWith =>
      __$$HeartStateImplCopyWithImpl<_$HeartStateImpl>(this, _$identity);
}

abstract class _HeartState implements HeartState {
  const factory _HeartState(
      {final HeartStatus status,
      final HeartRecord? record,
      final bool isLoading,
      final String? error}) = _$HeartStateImpl;

  @override
  HeartStatus get status;
  @override
  HeartRecord? get record;
  @override
  bool get isLoading;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$HeartStateImplCopyWith<_$HeartStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DateInvitation _$DateInvitationFromJson(Map<String, dynamic> json) {
  return _DateInvitation.fromJson(json);
}

/// @nodoc
mixin _$DateInvitation {
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
  $DateInvitationCopyWith<DateInvitation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DateInvitationCopyWith<$Res> {
  factory $DateInvitationCopyWith(
          DateInvitation value, $Res Function(DateInvitation) then) =
      _$DateInvitationCopyWithImpl<$Res, DateInvitation>;
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
class _$DateInvitationCopyWithImpl<$Res, $Val extends DateInvitation>
    implements $DateInvitationCopyWith<$Res> {
  _$DateInvitationCopyWithImpl(this._value, this._then);

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
abstract class _$$DateInvitationImplCopyWith<$Res>
    implements $DateInvitationCopyWith<$Res> {
  factory _$$DateInvitationImplCopyWith(_$DateInvitationImpl value,
          $Res Function(_$DateInvitationImpl) then) =
      __$$DateInvitationImplCopyWithImpl<$Res>;
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
class __$$DateInvitationImplCopyWithImpl<$Res>
    extends _$DateInvitationCopyWithImpl<$Res, _$DateInvitationImpl>
    implements _$$DateInvitationImplCopyWith<$Res> {
  __$$DateInvitationImplCopyWithImpl(
      _$DateInvitationImpl _value, $Res Function(_$DateInvitationImpl) _then)
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
    return _then(_$DateInvitationImpl(
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
class _$DateInvitationImpl implements _DateInvitation {
  const _$DateInvitationImpl(
      {required this.id,
      required this.senderId,
      required this.receiverId,
      this.status = 'pending',
      this.message,
      this.proposedTime,
      this.location,
      this.createdAt,
      this.respondedAt});

  factory _$DateInvitationImpl.fromJson(Map<String, dynamic> json) =>
      _$$DateInvitationImplFromJson(json);

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
    return 'DateInvitation(id: $id, senderId: $senderId, receiverId: $receiverId, status: $status, message: $message, proposedTime: $proposedTime, location: $location, createdAt: $createdAt, respondedAt: $respondedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DateInvitationImpl &&
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
  _$$DateInvitationImplCopyWith<_$DateInvitationImpl> get copyWith =>
      __$$DateInvitationImplCopyWithImpl<_$DateInvitationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DateInvitationImplToJson(
      this,
    );
  }
}

abstract class _DateInvitation implements DateInvitation {
  const factory _DateInvitation(
      {required final String id,
      required final String senderId,
      required final String receiverId,
      final String status,
      final String? message,
      final DateTime? proposedTime,
      final String? location,
      final DateTime? createdAt,
      final DateTime? respondedAt}) = _$DateInvitationImpl;

  factory _DateInvitation.fromJson(Map<String, dynamic> json) =
      _$DateInvitationImpl.fromJson;

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
  _$$DateInvitationImplCopyWith<_$DateInvitationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HeartUserInfo _$HeartUserInfoFromJson(Map<String, dynamic> json) {
  return _HeartUserInfo.fromJson(json);
}

/// @nodoc
mixin _$HeartUserInfo {
  String get userId => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  String? get avatarUrl => throw _privateConstructorUsedError;
  bool get hasHeart => throw _privateConstructorUsedError; // 是否已发送红心
  bool get isMutual => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HeartUserInfoCopyWith<HeartUserInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HeartUserInfoCopyWith<$Res> {
  factory $HeartUserInfoCopyWith(
          HeartUserInfo value, $Res Function(HeartUserInfo) then) =
      _$HeartUserInfoCopyWithImpl<$Res, HeartUserInfo>;
  @useResult
  $Res call(
      {String userId,
      String nickname,
      String? avatarUrl,
      bool hasHeart,
      bool isMutual});
}

/// @nodoc
class _$HeartUserInfoCopyWithImpl<$Res, $Val extends HeartUserInfo>
    implements $HeartUserInfoCopyWith<$Res> {
  _$HeartUserInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? nickname = null,
    Object? avatarUrl = freezed,
    Object? hasHeart = null,
    Object? isMutual = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      hasHeart: null == hasHeart
          ? _value.hasHeart
          : hasHeart // ignore: cast_nullable_to_non_nullable
              as bool,
      isMutual: null == isMutual
          ? _value.isMutual
          : isMutual // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HeartUserInfoImplCopyWith<$Res>
    implements $HeartUserInfoCopyWith<$Res> {
  factory _$$HeartUserInfoImplCopyWith(
          _$HeartUserInfoImpl value, $Res Function(_$HeartUserInfoImpl) then) =
      __$$HeartUserInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      String nickname,
      String? avatarUrl,
      bool hasHeart,
      bool isMutual});
}

/// @nodoc
class __$$HeartUserInfoImplCopyWithImpl<$Res>
    extends _$HeartUserInfoCopyWithImpl<$Res, _$HeartUserInfoImpl>
    implements _$$HeartUserInfoImplCopyWith<$Res> {
  __$$HeartUserInfoImplCopyWithImpl(
      _$HeartUserInfoImpl _value, $Res Function(_$HeartUserInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? nickname = null,
    Object? avatarUrl = freezed,
    Object? hasHeart = null,
    Object? isMutual = null,
  }) {
    return _then(_$HeartUserInfoImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      hasHeart: null == hasHeart
          ? _value.hasHeart
          : hasHeart // ignore: cast_nullable_to_non_nullable
              as bool,
      isMutual: null == isMutual
          ? _value.isMutual
          : isMutual // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HeartUserInfoImpl implements _HeartUserInfo {
  const _$HeartUserInfoImpl(
      {required this.userId,
      required this.nickname,
      this.avatarUrl,
      this.hasHeart = false,
      this.isMutual = false});

  factory _$HeartUserInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$HeartUserInfoImplFromJson(json);

  @override
  final String userId;
  @override
  final String nickname;
  @override
  final String? avatarUrl;
  @override
  @JsonKey()
  final bool hasHeart;
// 是否已发送红心
  @override
  @JsonKey()
  final bool isMutual;

  @override
  String toString() {
    return 'HeartUserInfo(userId: $userId, nickname: $nickname, avatarUrl: $avatarUrl, hasHeart: $hasHeart, isMutual: $isMutual)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HeartUserInfoImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.hasHeart, hasHeart) ||
                other.hasHeart == hasHeart) &&
            (identical(other.isMutual, isMutual) ||
                other.isMutual == isMutual));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, nickname, avatarUrl, hasHeart, isMutual);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HeartUserInfoImplCopyWith<_$HeartUserInfoImpl> get copyWith =>
      __$$HeartUserInfoImplCopyWithImpl<_$HeartUserInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HeartUserInfoImplToJson(
      this,
    );
  }
}

abstract class _HeartUserInfo implements HeartUserInfo {
  const factory _HeartUserInfo(
      {required final String userId,
      required final String nickname,
      final String? avatarUrl,
      final bool hasHeart,
      final bool isMutual}) = _$HeartUserInfoImpl;

  factory _HeartUserInfo.fromJson(Map<String, dynamic> json) =
      _$HeartUserInfoImpl.fromJson;

  @override
  String get userId;
  @override
  String get nickname;
  @override
  String? get avatarUrl;
  @override
  bool get hasHeart;
  @override // 是否已发送红心
  bool get isMutual;
  @override
  @JsonKey(ignore: true)
  _$$HeartUserInfoImplCopyWith<_$HeartUserInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
