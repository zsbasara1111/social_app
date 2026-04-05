import 'package:freezed_annotation/freezed_annotation.dart';

part 'match_models.freezed.dart';
part 'match_models.g.dart';

/// 匹配用户模型
@freezed
class MatchUser with _$MatchUser {
  const factory MatchUser({
    required String id,
    required String nickname,
    String? avatarUrl,
    required int age,
    required String city,
    String? bio,
    required int matchScore,
    required List<String> commonHobbies,
    required List<String> photos,
    DateTime? lastActiveAt,
  }) = _MatchUser;

  factory MatchUser.fromJson(Map<String, dynamic> json) =>
      _$MatchUserFromJson(json);
}

/// 匹配设置模型
@freezed
class MatchSettings with _$MatchSettings {
  const factory MatchSettings({
    @Default(1) int minMatchScore,
    @Default('all') String targetGender,
    @Default(18) int minAge,
    @Default(35) int maxAge,
    @Default('same_city') String locationType,
    String? city,
  }) = _MatchSettings;

  factory MatchSettings.fromJson(Map<String, dynamic> json) =>
      _$MatchSettingsFromJson(json);

  factory MatchSettings.defaultSettings() => const MatchSettings();
}

/// 匹配关系模型
@freezed
class MatchRelationship with _$MatchRelationship {
  const factory MatchRelationship({
    required String id,
    required String userId1,
    required String userId2,
    required int matchScore,
    @Default('pending') String status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _MatchRelationship;

  factory MatchRelationship.fromJson(Map<String, dynamic> json) =>
      _$MatchRelationshipFromJson(json);
}

/// 滑动操作类型
enum SwipeDirection {
  left,   // 不喜欢
  right,  // 喜欢
  up,     // 超级喜欢
}

/// 匹配算法结果
@freezed
class MatchResult with _$MatchResult {
  const factory MatchResult({
    required String userId,
    required int score,
    required List<String> commonItems,
    required Map<String, List<String>> matchedCategories,
  }) = _MatchResult;

  factory MatchResult.fromJson(Map<String, dynamic> json) =>
      _$MatchResultFromJson(json);
}

/// 匹配状态
@freezed
class MatchState with _$MatchState {
  const factory MatchState({
    @Default([]) List<MatchUser> users,
    @Default(false) bool isLoading,
    @Default(false) bool hasMore,
    String? error,
    @Default(0) int currentIndex,
  }) = _MatchState;

  factory MatchState.initial() => const MatchState();
}
