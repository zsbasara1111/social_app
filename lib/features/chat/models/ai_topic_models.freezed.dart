// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_topic_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AITopic _$AITopicFromJson(Map<String, dynamic> json) {
  return _AITopic.fromJson(json);
}

/// @nodoc
mixin _$AITopic {
  String get id => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  bool get isUsed => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AITopicCopyWith<AITopic> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AITopicCopyWith<$Res> {
  factory $AITopicCopyWith(AITopic value, $Res Function(AITopic) then) =
      _$AITopicCopyWithImpl<$Res, AITopic>;
  @useResult
  $Res call(
      {String id,
      String content,
      String? category,
      bool isUsed,
      DateTime? createdAt});
}

/// @nodoc
class _$AITopicCopyWithImpl<$Res, $Val extends AITopic>
    implements $AITopicCopyWith<$Res> {
  _$AITopicCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? category = freezed,
    Object? isUsed = null,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      isUsed: null == isUsed
          ? _value.isUsed
          : isUsed // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AITopicImplCopyWith<$Res> implements $AITopicCopyWith<$Res> {
  factory _$$AITopicImplCopyWith(
          _$AITopicImpl value, $Res Function(_$AITopicImpl) then) =
      __$$AITopicImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String content,
      String? category,
      bool isUsed,
      DateTime? createdAt});
}

/// @nodoc
class __$$AITopicImplCopyWithImpl<$Res>
    extends _$AITopicCopyWithImpl<$Res, _$AITopicImpl>
    implements _$$AITopicImplCopyWith<$Res> {
  __$$AITopicImplCopyWithImpl(
      _$AITopicImpl _value, $Res Function(_$AITopicImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? category = freezed,
    Object? isUsed = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$AITopicImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      isUsed: null == isUsed
          ? _value.isUsed
          : isUsed // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AITopicImpl implements _AITopic {
  const _$AITopicImpl(
      {required this.id,
      required this.content,
      this.category,
      this.isUsed = false,
      this.createdAt});

  factory _$AITopicImpl.fromJson(Map<String, dynamic> json) =>
      _$$AITopicImplFromJson(json);

  @override
  final String id;
  @override
  final String content;
  @override
  final String? category;
  @override
  @JsonKey()
  final bool isUsed;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'AITopic(id: $id, content: $content, category: $category, isUsed: $isUsed, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AITopicImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.isUsed, isUsed) || other.isUsed == isUsed) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, content, category, isUsed, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AITopicImplCopyWith<_$AITopicImpl> get copyWith =>
      __$$AITopicImplCopyWithImpl<_$AITopicImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AITopicImplToJson(
      this,
    );
  }
}

abstract class _AITopic implements AITopic {
  const factory _AITopic(
      {required final String id,
      required final String content,
      final String? category,
      final bool isUsed,
      final DateTime? createdAt}) = _$AITopicImpl;

  factory _AITopic.fromJson(Map<String, dynamic> json) = _$AITopicImpl.fromJson;

  @override
  String get id;
  @override
  String get content;
  @override
  String? get category;
  @override
  bool get isUsed;
  @override
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$AITopicImplCopyWith<_$AITopicImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TopicGenerationRequest _$TopicGenerationRequestFromJson(
    Map<String, dynamic> json) {
  return _TopicGenerationRequest.fromJson(json);
}

/// @nodoc
mixin _$TopicGenerationRequest {
  String get userAId => throw _privateConstructorUsedError;
  String get userBId => throw _privateConstructorUsedError;
  List<String> get userAHobbies => throw _privateConstructorUsedError;
  List<String> get userBHobbies => throw _privateConstructorUsedError;
  List<String> get commonHobbies => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TopicGenerationRequestCopyWith<TopicGenerationRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopicGenerationRequestCopyWith<$Res> {
  factory $TopicGenerationRequestCopyWith(TopicGenerationRequest value,
          $Res Function(TopicGenerationRequest) then) =
      _$TopicGenerationRequestCopyWithImpl<$Res, TopicGenerationRequest>;
  @useResult
  $Res call(
      {String userAId,
      String userBId,
      List<String> userAHobbies,
      List<String> userBHobbies,
      List<String> commonHobbies});
}

/// @nodoc
class _$TopicGenerationRequestCopyWithImpl<$Res,
        $Val extends TopicGenerationRequest>
    implements $TopicGenerationRequestCopyWith<$Res> {
  _$TopicGenerationRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userAId = null,
    Object? userBId = null,
    Object? userAHobbies = null,
    Object? userBHobbies = null,
    Object? commonHobbies = null,
  }) {
    return _then(_value.copyWith(
      userAId: null == userAId
          ? _value.userAId
          : userAId // ignore: cast_nullable_to_non_nullable
              as String,
      userBId: null == userBId
          ? _value.userBId
          : userBId // ignore: cast_nullable_to_non_nullable
              as String,
      userAHobbies: null == userAHobbies
          ? _value.userAHobbies
          : userAHobbies // ignore: cast_nullable_to_non_nullable
              as List<String>,
      userBHobbies: null == userBHobbies
          ? _value.userBHobbies
          : userBHobbies // ignore: cast_nullable_to_non_nullable
              as List<String>,
      commonHobbies: null == commonHobbies
          ? _value.commonHobbies
          : commonHobbies // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TopicGenerationRequestImplCopyWith<$Res>
    implements $TopicGenerationRequestCopyWith<$Res> {
  factory _$$TopicGenerationRequestImplCopyWith(
          _$TopicGenerationRequestImpl value,
          $Res Function(_$TopicGenerationRequestImpl) then) =
      __$$TopicGenerationRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userAId,
      String userBId,
      List<String> userAHobbies,
      List<String> userBHobbies,
      List<String> commonHobbies});
}

/// @nodoc
class __$$TopicGenerationRequestImplCopyWithImpl<$Res>
    extends _$TopicGenerationRequestCopyWithImpl<$Res,
        _$TopicGenerationRequestImpl>
    implements _$$TopicGenerationRequestImplCopyWith<$Res> {
  __$$TopicGenerationRequestImplCopyWithImpl(
      _$TopicGenerationRequestImpl _value,
      $Res Function(_$TopicGenerationRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userAId = null,
    Object? userBId = null,
    Object? userAHobbies = null,
    Object? userBHobbies = null,
    Object? commonHobbies = null,
  }) {
    return _then(_$TopicGenerationRequestImpl(
      userAId: null == userAId
          ? _value.userAId
          : userAId // ignore: cast_nullable_to_non_nullable
              as String,
      userBId: null == userBId
          ? _value.userBId
          : userBId // ignore: cast_nullable_to_non_nullable
              as String,
      userAHobbies: null == userAHobbies
          ? _value._userAHobbies
          : userAHobbies // ignore: cast_nullable_to_non_nullable
              as List<String>,
      userBHobbies: null == userBHobbies
          ? _value._userBHobbies
          : userBHobbies // ignore: cast_nullable_to_non_nullable
              as List<String>,
      commonHobbies: null == commonHobbies
          ? _value._commonHobbies
          : commonHobbies // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TopicGenerationRequestImpl implements _TopicGenerationRequest {
  const _$TopicGenerationRequestImpl(
      {required this.userAId,
      required this.userBId,
      required final List<String> userAHobbies,
      required final List<String> userBHobbies,
      required final List<String> commonHobbies})
      : _userAHobbies = userAHobbies,
        _userBHobbies = userBHobbies,
        _commonHobbies = commonHobbies;

  factory _$TopicGenerationRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$TopicGenerationRequestImplFromJson(json);

  @override
  final String userAId;
  @override
  final String userBId;
  final List<String> _userAHobbies;
  @override
  List<String> get userAHobbies {
    if (_userAHobbies is EqualUnmodifiableListView) return _userAHobbies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userAHobbies);
  }

  final List<String> _userBHobbies;
  @override
  List<String> get userBHobbies {
    if (_userBHobbies is EqualUnmodifiableListView) return _userBHobbies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userBHobbies);
  }

  final List<String> _commonHobbies;
  @override
  List<String> get commonHobbies {
    if (_commonHobbies is EqualUnmodifiableListView) return _commonHobbies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_commonHobbies);
  }

  @override
  String toString() {
    return 'TopicGenerationRequest(userAId: $userAId, userBId: $userBId, userAHobbies: $userAHobbies, userBHobbies: $userBHobbies, commonHobbies: $commonHobbies)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TopicGenerationRequestImpl &&
            (identical(other.userAId, userAId) || other.userAId == userAId) &&
            (identical(other.userBId, userBId) || other.userBId == userBId) &&
            const DeepCollectionEquality()
                .equals(other._userAHobbies, _userAHobbies) &&
            const DeepCollectionEquality()
                .equals(other._userBHobbies, _userBHobbies) &&
            const DeepCollectionEquality()
                .equals(other._commonHobbies, _commonHobbies));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userAId,
      userBId,
      const DeepCollectionEquality().hash(_userAHobbies),
      const DeepCollectionEquality().hash(_userBHobbies),
      const DeepCollectionEquality().hash(_commonHobbies));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TopicGenerationRequestImplCopyWith<_$TopicGenerationRequestImpl>
      get copyWith => __$$TopicGenerationRequestImplCopyWithImpl<
          _$TopicGenerationRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TopicGenerationRequestImplToJson(
      this,
    );
  }
}

abstract class _TopicGenerationRequest implements TopicGenerationRequest {
  const factory _TopicGenerationRequest(
          {required final String userAId,
          required final String userBId,
          required final List<String> userAHobbies,
          required final List<String> userBHobbies,
          required final List<String> commonHobbies}) =
      _$TopicGenerationRequestImpl;

  factory _TopicGenerationRequest.fromJson(Map<String, dynamic> json) =
      _$TopicGenerationRequestImpl.fromJson;

  @override
  String get userAId;
  @override
  String get userBId;
  @override
  List<String> get userAHobbies;
  @override
  List<String> get userBHobbies;
  @override
  List<String> get commonHobbies;
  @override
  @JsonKey(ignore: true)
  _$$TopicGenerationRequestImplCopyWith<_$TopicGenerationRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

TopicGenerationResponse _$TopicGenerationResponseFromJson(
    Map<String, dynamic> json) {
  return _TopicGenerationResponse.fromJson(json);
}

/// @nodoc
mixin _$TopicGenerationResponse {
  String get topic => throw _privateConstructorUsedError;
  String? get explanation => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TopicGenerationResponseCopyWith<TopicGenerationResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopicGenerationResponseCopyWith<$Res> {
  factory $TopicGenerationResponseCopyWith(TopicGenerationResponse value,
          $Res Function(TopicGenerationResponse) then) =
      _$TopicGenerationResponseCopyWithImpl<$Res, TopicGenerationResponse>;
  @useResult
  $Res call({String topic, String? explanation, bool success, String? error});
}

/// @nodoc
class _$TopicGenerationResponseCopyWithImpl<$Res,
        $Val extends TopicGenerationResponse>
    implements $TopicGenerationResponseCopyWith<$Res> {
  _$TopicGenerationResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topic = null,
    Object? explanation = freezed,
    Object? success = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      topic: null == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String,
      explanation: freezed == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String?,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TopicGenerationResponseImplCopyWith<$Res>
    implements $TopicGenerationResponseCopyWith<$Res> {
  factory _$$TopicGenerationResponseImplCopyWith(
          _$TopicGenerationResponseImpl value,
          $Res Function(_$TopicGenerationResponseImpl) then) =
      __$$TopicGenerationResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String topic, String? explanation, bool success, String? error});
}

/// @nodoc
class __$$TopicGenerationResponseImplCopyWithImpl<$Res>
    extends _$TopicGenerationResponseCopyWithImpl<$Res,
        _$TopicGenerationResponseImpl>
    implements _$$TopicGenerationResponseImplCopyWith<$Res> {
  __$$TopicGenerationResponseImplCopyWithImpl(
      _$TopicGenerationResponseImpl _value,
      $Res Function(_$TopicGenerationResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topic = null,
    Object? explanation = freezed,
    Object? success = null,
    Object? error = freezed,
  }) {
    return _then(_$TopicGenerationResponseImpl(
      topic: null == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String,
      explanation: freezed == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String?,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TopicGenerationResponseImpl implements _TopicGenerationResponse {
  const _$TopicGenerationResponseImpl(
      {required this.topic,
      this.explanation,
      this.success = false,
      this.error});

  factory _$TopicGenerationResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TopicGenerationResponseImplFromJson(json);

  @override
  final String topic;
  @override
  final String? explanation;
  @override
  @JsonKey()
  final bool success;
  @override
  final String? error;

  @override
  String toString() {
    return 'TopicGenerationResponse(topic: $topic, explanation: $explanation, success: $success, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TopicGenerationResponseImpl &&
            (identical(other.topic, topic) || other.topic == topic) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, topic, explanation, success, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TopicGenerationResponseImplCopyWith<_$TopicGenerationResponseImpl>
      get copyWith => __$$TopicGenerationResponseImplCopyWithImpl<
          _$TopicGenerationResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TopicGenerationResponseImplToJson(
      this,
    );
  }
}

abstract class _TopicGenerationResponse implements TopicGenerationResponse {
  const factory _TopicGenerationResponse(
      {required final String topic,
      final String? explanation,
      final bool success,
      final String? error}) = _$TopicGenerationResponseImpl;

  factory _TopicGenerationResponse.fromJson(Map<String, dynamic> json) =
      _$TopicGenerationResponseImpl.fromJson;

  @override
  String get topic;
  @override
  String? get explanation;
  @override
  bool get success;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$TopicGenerationResponseImplCopyWith<_$TopicGenerationResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AIAssistantState {
  bool get isLoading => throw _privateConstructorUsedError;
  AITopic? get currentTopic => throw _privateConstructorUsedError;
  List<AITopic> get topicHistory => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AIAssistantStateCopyWith<AIAssistantState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AIAssistantStateCopyWith<$Res> {
  factory $AIAssistantStateCopyWith(
          AIAssistantState value, $Res Function(AIAssistantState) then) =
      _$AIAssistantStateCopyWithImpl<$Res, AIAssistantState>;
  @useResult
  $Res call(
      {bool isLoading,
      AITopic? currentTopic,
      List<AITopic> topicHistory,
      String? error});

  $AITopicCopyWith<$Res>? get currentTopic;
}

/// @nodoc
class _$AIAssistantStateCopyWithImpl<$Res, $Val extends AIAssistantState>
    implements $AIAssistantStateCopyWith<$Res> {
  _$AIAssistantStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? currentTopic = freezed,
    Object? topicHistory = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      currentTopic: freezed == currentTopic
          ? _value.currentTopic
          : currentTopic // ignore: cast_nullable_to_non_nullable
              as AITopic?,
      topicHistory: null == topicHistory
          ? _value.topicHistory
          : topicHistory // ignore: cast_nullable_to_non_nullable
              as List<AITopic>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AITopicCopyWith<$Res>? get currentTopic {
    if (_value.currentTopic == null) {
      return null;
    }

    return $AITopicCopyWith<$Res>(_value.currentTopic!, (value) {
      return _then(_value.copyWith(currentTopic: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AIAssistantStateImplCopyWith<$Res>
    implements $AIAssistantStateCopyWith<$Res> {
  factory _$$AIAssistantStateImplCopyWith(_$AIAssistantStateImpl value,
          $Res Function(_$AIAssistantStateImpl) then) =
      __$$AIAssistantStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      AITopic? currentTopic,
      List<AITopic> topicHistory,
      String? error});

  @override
  $AITopicCopyWith<$Res>? get currentTopic;
}

/// @nodoc
class __$$AIAssistantStateImplCopyWithImpl<$Res>
    extends _$AIAssistantStateCopyWithImpl<$Res, _$AIAssistantStateImpl>
    implements _$$AIAssistantStateImplCopyWith<$Res> {
  __$$AIAssistantStateImplCopyWithImpl(_$AIAssistantStateImpl _value,
      $Res Function(_$AIAssistantStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? currentTopic = freezed,
    Object? topicHistory = null,
    Object? error = freezed,
  }) {
    return _then(_$AIAssistantStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      currentTopic: freezed == currentTopic
          ? _value.currentTopic
          : currentTopic // ignore: cast_nullable_to_non_nullable
              as AITopic?,
      topicHistory: null == topicHistory
          ? _value._topicHistory
          : topicHistory // ignore: cast_nullable_to_non_nullable
              as List<AITopic>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AIAssistantStateImpl implements _AIAssistantState {
  const _$AIAssistantStateImpl(
      {this.isLoading = false,
      this.currentTopic,
      final List<AITopic> topicHistory = const [],
      this.error})
      : _topicHistory = topicHistory;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final AITopic? currentTopic;
  final List<AITopic> _topicHistory;
  @override
  @JsonKey()
  List<AITopic> get topicHistory {
    if (_topicHistory is EqualUnmodifiableListView) return _topicHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topicHistory);
  }

  @override
  final String? error;

  @override
  String toString() {
    return 'AIAssistantState(isLoading: $isLoading, currentTopic: $currentTopic, topicHistory: $topicHistory, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AIAssistantStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.currentTopic, currentTopic) ||
                other.currentTopic == currentTopic) &&
            const DeepCollectionEquality()
                .equals(other._topicHistory, _topicHistory) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, currentTopic,
      const DeepCollectionEquality().hash(_topicHistory), error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AIAssistantStateImplCopyWith<_$AIAssistantStateImpl> get copyWith =>
      __$$AIAssistantStateImplCopyWithImpl<_$AIAssistantStateImpl>(
          this, _$identity);
}

abstract class _AIAssistantState implements AIAssistantState {
  const factory _AIAssistantState(
      {final bool isLoading,
      final AITopic? currentTopic,
      final List<AITopic> topicHistory,
      final String? error}) = _$AIAssistantStateImpl;

  @override
  bool get isLoading;
  @override
  AITopic? get currentTopic;
  @override
  List<AITopic> get topicHistory;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$AIAssistantStateImplCopyWith<_$AIAssistantStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChatContext _$ChatContextFromJson(Map<String, dynamic> json) {
  return _ChatContext.fromJson(json);
}

/// @nodoc
mixin _$ChatContext {
  String get userId => throw _privateConstructorUsedError;
  String get otherUserId => throw _privateConstructorUsedError;
  String get otherUserName => throw _privateConstructorUsedError;
  List<String> get recentMessages => throw _privateConstructorUsedError;
  DateTime? get lastMessageTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatContextCopyWith<ChatContext> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatContextCopyWith<$Res> {
  factory $ChatContextCopyWith(
          ChatContext value, $Res Function(ChatContext) then) =
      _$ChatContextCopyWithImpl<$Res, ChatContext>;
  @useResult
  $Res call(
      {String userId,
      String otherUserId,
      String otherUserName,
      List<String> recentMessages,
      DateTime? lastMessageTime});
}

/// @nodoc
class _$ChatContextCopyWithImpl<$Res, $Val extends ChatContext>
    implements $ChatContextCopyWith<$Res> {
  _$ChatContextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? otherUserId = null,
    Object? otherUserName = null,
    Object? recentMessages = null,
    Object? lastMessageTime = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      otherUserId: null == otherUserId
          ? _value.otherUserId
          : otherUserId // ignore: cast_nullable_to_non_nullable
              as String,
      otherUserName: null == otherUserName
          ? _value.otherUserName
          : otherUserName // ignore: cast_nullable_to_non_nullable
              as String,
      recentMessages: null == recentMessages
          ? _value.recentMessages
          : recentMessages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lastMessageTime: freezed == lastMessageTime
          ? _value.lastMessageTime
          : lastMessageTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatContextImplCopyWith<$Res>
    implements $ChatContextCopyWith<$Res> {
  factory _$$ChatContextImplCopyWith(
          _$ChatContextImpl value, $Res Function(_$ChatContextImpl) then) =
      __$$ChatContextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      String otherUserId,
      String otherUserName,
      List<String> recentMessages,
      DateTime? lastMessageTime});
}

/// @nodoc
class __$$ChatContextImplCopyWithImpl<$Res>
    extends _$ChatContextCopyWithImpl<$Res, _$ChatContextImpl>
    implements _$$ChatContextImplCopyWith<$Res> {
  __$$ChatContextImplCopyWithImpl(
      _$ChatContextImpl _value, $Res Function(_$ChatContextImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? otherUserId = null,
    Object? otherUserName = null,
    Object? recentMessages = null,
    Object? lastMessageTime = freezed,
  }) {
    return _then(_$ChatContextImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      otherUserId: null == otherUserId
          ? _value.otherUserId
          : otherUserId // ignore: cast_nullable_to_non_nullable
              as String,
      otherUserName: null == otherUserName
          ? _value.otherUserName
          : otherUserName // ignore: cast_nullable_to_non_nullable
              as String,
      recentMessages: null == recentMessages
          ? _value._recentMessages
          : recentMessages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lastMessageTime: freezed == lastMessageTime
          ? _value.lastMessageTime
          : lastMessageTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatContextImpl implements _ChatContext {
  const _$ChatContextImpl(
      {required this.userId,
      required this.otherUserId,
      required this.otherUserName,
      final List<String> recentMessages = const [],
      this.lastMessageTime})
      : _recentMessages = recentMessages;

  factory _$ChatContextImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatContextImplFromJson(json);

  @override
  final String userId;
  @override
  final String otherUserId;
  @override
  final String otherUserName;
  final List<String> _recentMessages;
  @override
  @JsonKey()
  List<String> get recentMessages {
    if (_recentMessages is EqualUnmodifiableListView) return _recentMessages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentMessages);
  }

  @override
  final DateTime? lastMessageTime;

  @override
  String toString() {
    return 'ChatContext(userId: $userId, otherUserId: $otherUserId, otherUserName: $otherUserName, recentMessages: $recentMessages, lastMessageTime: $lastMessageTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatContextImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.otherUserId, otherUserId) ||
                other.otherUserId == otherUserId) &&
            (identical(other.otherUserName, otherUserName) ||
                other.otherUserName == otherUserName) &&
            const DeepCollectionEquality()
                .equals(other._recentMessages, _recentMessages) &&
            (identical(other.lastMessageTime, lastMessageTime) ||
                other.lastMessageTime == lastMessageTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      otherUserId,
      otherUserName,
      const DeepCollectionEquality().hash(_recentMessages),
      lastMessageTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatContextImplCopyWith<_$ChatContextImpl> get copyWith =>
      __$$ChatContextImplCopyWithImpl<_$ChatContextImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatContextImplToJson(
      this,
    );
  }
}

abstract class _ChatContext implements ChatContext {
  const factory _ChatContext(
      {required final String userId,
      required final String otherUserId,
      required final String otherUserName,
      final List<String> recentMessages,
      final DateTime? lastMessageTime}) = _$ChatContextImpl;

  factory _ChatContext.fromJson(Map<String, dynamic> json) =
      _$ChatContextImpl.fromJson;

  @override
  String get userId;
  @override
  String get otherUserId;
  @override
  String get otherUserName;
  @override
  List<String> get recentMessages;
  @override
  DateTime? get lastMessageTime;
  @override
  @JsonKey(ignore: true)
  _$$ChatContextImplCopyWith<_$ChatContextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
