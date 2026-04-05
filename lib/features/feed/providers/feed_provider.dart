import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/post_models.dart';
import '../services/feed_service.dart';

// 动态服务Provider
final feedServiceProvider = Provider<FeedService>((ref) => FeedService());

// 当前分类Provider
final feedCategoryProvider = StateProvider<PostCategory>((ref) => PostCategory.sameCity);

// 动态列表Provider
final feedPostsProvider = StateNotifierProvider<FeedPostsNotifier, FeedState>((ref) {
  return FeedPostsNotifier(ref.read(feedServiceProvider));
});

class FeedPostsNotifier extends StateNotifier<FeedState> {
  final FeedService _service;
  PostCategory _currentCategory = PostCategory.sameCity;

  FeedPostsNotifier(this._service) : super(FeedState.initial());

  Future<void> loadPosts({
    PostCategory? category,
    bool refresh = false,
  }) async {
    if (state.isLoading) return;

    if (category != null) {
      _currentCategory = category;
    }

    state = state.copyWith(isLoading: true, error: null);

    try {
      final posts = await _service.getPosts(
        category: _currentCategory,
        page: refresh ? 0 : state.currentPage,
      );

      state = state.copyWith(
        posts: refresh ? posts : [...state.posts, ...posts],
        isLoading: false,
        hasMore: posts.length == 20,
        currentPage: refresh ? 1 : state.currentPage + 1,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  Future<void> refresh() async {
    await loadPosts(refresh: true);
  }

  Future<void> loadMore() async {
    if (!state.hasMore || state.isLoading) return;
    await loadPosts();
  }

  Future<void> createPost(CreatePostRequest request) async {
    try {
      final post = await _service.createPost(request);
      state = state.copyWith(
        posts: [post, ...state.posts],
      );
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  Future<void> toggleLike(String postId) async {
    final posts = state.posts.map((post) {
      if (post.id == postId) {
        final isLiked = !post.isLiked;
        if (isLiked) {
          _service.likePost(postId);
        } else {
          _service.unlikePost(postId);
        }
        return post.copyWith(
          isLiked: isLiked,
          likeCount: post.likeCount + (isLiked ? 1 : -1),
        );
      }
      return post;
    }).toList();

    state = state.copyWith(posts: posts);
  }

  Future<void> deletePost(String postId) async {
    try {
      await _service.deletePost(postId);
      final posts = state.posts.where((p) => p.id != postId).toList();
      state = state.copyWith(posts: posts);
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }
}

// 评论Provider
final postCommentsProvider = FutureProvider.family<List<Comment>, String>((ref, postId) async {
  final service = ref.read(feedServiceProvider);
  return service.getComments(postId);
});
