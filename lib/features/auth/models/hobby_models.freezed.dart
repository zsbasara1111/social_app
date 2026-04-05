// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hobby_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HobbyCategory _$HobbyCategoryFromJson(Map<String, dynamic> json) {
  return _HobbyCategory.fromJson(json);
}

/// @nodoc
mixin _$HobbyCategory {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
  bool get isCustom => throw _privateConstructorUsedError;
  bool get isPreset => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HobbyCategoryCopyWith<HobbyCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HobbyCategoryCopyWith<$Res> {
  factory $HobbyCategoryCopyWith(
          HobbyCategory value, $Res Function(HobbyCategory) then) =
      _$HobbyCategoryCopyWithImpl<$Res, HobbyCategory>;
  @useResult
  $Res call(
      {String id,
      String name,
      String? icon,
      bool isCustom,
      bool isPreset,
      DateTime? createdAt});
}

/// @nodoc
class _$HobbyCategoryCopyWithImpl<$Res, $Val extends HobbyCategory>
    implements $HobbyCategoryCopyWith<$Res> {
  _$HobbyCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? icon = freezed,
    Object? isCustom = null,
    Object? isPreset = null,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      isCustom: null == isCustom
          ? _value.isCustom
          : isCustom // ignore: cast_nullable_to_non_nullable
              as bool,
      isPreset: null == isPreset
          ? _value.isPreset
          : isPreset // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HobbyCategoryImplCopyWith<$Res>
    implements $HobbyCategoryCopyWith<$Res> {
  factory _$$HobbyCategoryImplCopyWith(
          _$HobbyCategoryImpl value, $Res Function(_$HobbyCategoryImpl) then) =
      __$$HobbyCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String? icon,
      bool isCustom,
      bool isPreset,
      DateTime? createdAt});
}

/// @nodoc
class __$$HobbyCategoryImplCopyWithImpl<$Res>
    extends _$HobbyCategoryCopyWithImpl<$Res, _$HobbyCategoryImpl>
    implements _$$HobbyCategoryImplCopyWith<$Res> {
  __$$HobbyCategoryImplCopyWithImpl(
      _$HobbyCategoryImpl _value, $Res Function(_$HobbyCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? icon = freezed,
    Object? isCustom = null,
    Object? isPreset = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$HobbyCategoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      isCustom: null == isCustom
          ? _value.isCustom
          : isCustom // ignore: cast_nullable_to_non_nullable
              as bool,
      isPreset: null == isPreset
          ? _value.isPreset
          : isPreset // ignore: cast_nullable_to_non_nullable
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
class _$HobbyCategoryImpl implements _HobbyCategory {
  const _$HobbyCategoryImpl(
      {required this.id,
      required this.name,
      this.icon,
      this.isCustom = false,
      this.isPreset = true,
      this.createdAt});

  factory _$HobbyCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$HobbyCategoryImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? icon;
  @override
  @JsonKey()
  final bool isCustom;
  @override
  @JsonKey()
  final bool isPreset;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'HobbyCategory(id: $id, name: $name, icon: $icon, isCustom: $isCustom, isPreset: $isPreset, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HobbyCategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.isCustom, isCustom) ||
                other.isCustom == isCustom) &&
            (identical(other.isPreset, isPreset) ||
                other.isPreset == isPreset) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, icon, isCustom, isPreset, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HobbyCategoryImplCopyWith<_$HobbyCategoryImpl> get copyWith =>
      __$$HobbyCategoryImplCopyWithImpl<_$HobbyCategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HobbyCategoryImplToJson(
      this,
    );
  }
}

abstract class _HobbyCategory implements HobbyCategory {
  const factory _HobbyCategory(
      {required final String id,
      required final String name,
      final String? icon,
      final bool isCustom,
      final bool isPreset,
      final DateTime? createdAt}) = _$HobbyCategoryImpl;

  factory _HobbyCategory.fromJson(Map<String, dynamic> json) =
      _$HobbyCategoryImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get icon;
  @override
  bool get isCustom;
  @override
  bool get isPreset;
  @override
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$HobbyCategoryImplCopyWith<_$HobbyCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserHobbyItem _$UserHobbyItemFromJson(Map<String, dynamic> json) {
  return _UserHobbyItem.fromJson(json);
}

/// @nodoc
mixin _$UserHobbyItem {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get categoryId => throw _privateConstructorUsedError;
  String get itemName => throw _privateConstructorUsedError;
  String? get categoryName => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserHobbyItemCopyWith<UserHobbyItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserHobbyItemCopyWith<$Res> {
  factory $UserHobbyItemCopyWith(
          UserHobbyItem value, $Res Function(UserHobbyItem) then) =
      _$UserHobbyItemCopyWithImpl<$Res, UserHobbyItem>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String categoryId,
      String itemName,
      String? categoryName,
      DateTime? createdAt});
}

/// @nodoc
class _$UserHobbyItemCopyWithImpl<$Res, $Val extends UserHobbyItem>
    implements $UserHobbyItemCopyWith<$Res> {
  _$UserHobbyItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? categoryId = null,
    Object? itemName = null,
    Object? categoryName = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      itemName: null == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserHobbyItemImplCopyWith<$Res>
    implements $UserHobbyItemCopyWith<$Res> {
  factory _$$UserHobbyItemImplCopyWith(
          _$UserHobbyItemImpl value, $Res Function(_$UserHobbyItemImpl) then) =
      __$$UserHobbyItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String categoryId,
      String itemName,
      String? categoryName,
      DateTime? createdAt});
}

/// @nodoc
class __$$UserHobbyItemImplCopyWithImpl<$Res>
    extends _$UserHobbyItemCopyWithImpl<$Res, _$UserHobbyItemImpl>
    implements _$$UserHobbyItemImplCopyWith<$Res> {
  __$$UserHobbyItemImplCopyWithImpl(
      _$UserHobbyItemImpl _value, $Res Function(_$UserHobbyItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? categoryId = null,
    Object? itemName = null,
    Object? categoryName = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$UserHobbyItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      itemName: null == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserHobbyItemImpl implements _UserHobbyItem {
  const _$UserHobbyItemImpl(
      {required this.id,
      required this.userId,
      required this.categoryId,
      required this.itemName,
      this.categoryName,
      this.createdAt});

  factory _$UserHobbyItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserHobbyItemImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String categoryId;
  @override
  final String itemName;
  @override
  final String? categoryName;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'UserHobbyItem(id: $id, userId: $userId, categoryId: $categoryId, itemName: $itemName, categoryName: $categoryName, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserHobbyItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.itemName, itemName) ||
                other.itemName == itemName) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, userId, categoryId, itemName, categoryName, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserHobbyItemImplCopyWith<_$UserHobbyItemImpl> get copyWith =>
      __$$UserHobbyItemImplCopyWithImpl<_$UserHobbyItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserHobbyItemImplToJson(
      this,
    );
  }
}

abstract class _UserHobbyItem implements UserHobbyItem {
  const factory _UserHobbyItem(
      {required final String id,
      required final String userId,
      required final String categoryId,
      required final String itemName,
      final String? categoryName,
      final DateTime? createdAt}) = _$UserHobbyItemImpl;

  factory _UserHobbyItem.fromJson(Map<String, dynamic> json) =
      _$UserHobbyItemImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get categoryId;
  @override
  String get itemName;
  @override
  String? get categoryName;
  @override
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$UserHobbyItemImplCopyWith<_$UserHobbyItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HobbySelectionState {
  Map<String, List<String>> get selectedItems =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSaving => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HobbySelectionStateCopyWith<HobbySelectionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HobbySelectionStateCopyWith<$Res> {
  factory $HobbySelectionStateCopyWith(
          HobbySelectionState value, $Res Function(HobbySelectionState) then) =
      _$HobbySelectionStateCopyWithImpl<$Res, HobbySelectionState>;
  @useResult
  $Res call(
      {Map<String, List<String>> selectedItems,
      bool isLoading,
      bool isSaving,
      String? error});
}

/// @nodoc
class _$HobbySelectionStateCopyWithImpl<$Res, $Val extends HobbySelectionState>
    implements $HobbySelectionStateCopyWith<$Res> {
  _$HobbySelectionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedItems = null,
    Object? isLoading = null,
    Object? isSaving = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      selectedItems: null == selectedItems
          ? _value.selectedItems
          : selectedItems // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaving: null == isSaving
          ? _value.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HobbySelectionStateImplCopyWith<$Res>
    implements $HobbySelectionStateCopyWith<$Res> {
  factory _$$HobbySelectionStateImplCopyWith(_$HobbySelectionStateImpl value,
          $Res Function(_$HobbySelectionStateImpl) then) =
      __$$HobbySelectionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, List<String>> selectedItems,
      bool isLoading,
      bool isSaving,
      String? error});
}

/// @nodoc
class __$$HobbySelectionStateImplCopyWithImpl<$Res>
    extends _$HobbySelectionStateCopyWithImpl<$Res, _$HobbySelectionStateImpl>
    implements _$$HobbySelectionStateImplCopyWith<$Res> {
  __$$HobbySelectionStateImplCopyWithImpl(_$HobbySelectionStateImpl _value,
      $Res Function(_$HobbySelectionStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedItems = null,
    Object? isLoading = null,
    Object? isSaving = null,
    Object? error = freezed,
  }) {
    return _then(_$HobbySelectionStateImpl(
      selectedItems: null == selectedItems
          ? _value._selectedItems
          : selectedItems // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaving: null == isSaving
          ? _value.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$HobbySelectionStateImpl implements _HobbySelectionState {
  const _$HobbySelectionStateImpl(
      {final Map<String, List<String>> selectedItems = const {},
      this.isLoading = false,
      this.isSaving = false,
      this.error})
      : _selectedItems = selectedItems;

  final Map<String, List<String>> _selectedItems;
  @override
  @JsonKey()
  Map<String, List<String>> get selectedItems {
    if (_selectedItems is EqualUnmodifiableMapView) return _selectedItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_selectedItems);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isSaving;
  @override
  final String? error;

  @override
  String toString() {
    return 'HobbySelectionState(selectedItems: $selectedItems, isLoading: $isLoading, isSaving: $isSaving, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HobbySelectionStateImpl &&
            const DeepCollectionEquality()
                .equals(other._selectedItems, _selectedItems) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSaving, isSaving) ||
                other.isSaving == isSaving) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_selectedItems),
      isLoading,
      isSaving,
      error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HobbySelectionStateImplCopyWith<_$HobbySelectionStateImpl> get copyWith =>
      __$$HobbySelectionStateImplCopyWithImpl<_$HobbySelectionStateImpl>(
          this, _$identity);
}

abstract class _HobbySelectionState implements HobbySelectionState {
  const factory _HobbySelectionState(
      {final Map<String, List<String>> selectedItems,
      final bool isLoading,
      final bool isSaving,
      final String? error}) = _$HobbySelectionStateImpl;

  @override
  Map<String, List<String>> get selectedItems;
  @override
  bool get isLoading;
  @override
  bool get isSaving;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$HobbySelectionStateImplCopyWith<_$HobbySelectionStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
