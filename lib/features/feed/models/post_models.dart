import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_models.freezed.dart';
part 'post_models.g.dart';

/// 动态模型
@freezed
class Post with _$Post {
  const factory Post({
    required String id,
    required String userId,
    required String content,
    @Default([]) List<String> images,
    String? location,
    @Default('public') String visibility, // public, friends
    @Default(0) int likeCount,
    @Default(0) int commentCount,
    @Default(false) bool isLiked,
    DateTime? createdAt,
    // 用户信息（关联查询）
    String? userNickname,
    String? userAvatar,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) =>
      _$PostFromJson(json);
}

/// 评论模型
@freezed
class Comment with _$Comment {
  const factory Comment({
    required String id,
    required String postId,
    required String userId,
    required String content,
    String? parentId, // 回复的评论ID
    DateTime? createdAt,
    // 用户信息
    String? userNickname,
    String? userAvatar,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}

/// 点赞模型
@freezed
class PostLike with _$PostLike {
  const factory PostLike({
    required String id,
    required String postId,
    required String userId,
    DateTime? createdAt,
  }) = _PostLike;

  factory PostLike.fromJson(Map<String, dynamic> json) =>
      _$PostLikeFromJson(json);
}

/// 动态类型/分类
enum PostCategory {
  sameCity,   // 同城
  friends,    // 好友
  recommended, // 推荐
}

/// 动态列表状态
@freezed
class FeedState with _$FeedState {
  const factory FeedState({
    @Default([]) List<Post> posts,
    @Default(false) bool isLoading,
    @Default(false) bool hasMore,
    String? error,
    @Default(0) int currentPage,
  }) = _FeedState;

  factory FeedState.initial() => const FeedState();
}

/// 发布动态请求
@freezed
class CreatePostRequest with _$CreatePostRequest {
  const factory CreatePostRequest({
    required String content,
    @Default([]) List<String> images,
    String? location,
    @Default('public') String visibility,
  }) = _CreatePostRequest;

  factory CreatePostRequest.fromJson(Map<String, dynamic> json) =>
      _$CreatePostRequestFromJson(json);
}
