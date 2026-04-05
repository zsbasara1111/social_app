import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/services/supabase_service.dart';
import '../models/match_models.dart';
import '../services/match_service.dart';

// 匹配服务Provider
final matchServiceProvider = Provider<MatchService>((ref) => MatchService());

// 匹配设置Provider
final matchSettingsProvider = FutureProvider<MatchSettings>((ref) async {
  final service = ref.read(matchServiceProvider);
  final userId = SupabaseService.currentUserId;
  if (userId == null) return MatchSettings.defaultSettings();
  return service.getMatchSettings(userId);
});

// 匹配用户列表Provider
final matchUsersProvider = StateNotifierProvider<MatchUsersNotifier, MatchState>((ref) {
  return MatchUsersNotifier(ref.read(matchServiceProvider));
});

class MatchUsersNotifier extends StateNotifier<MatchState> {
  final MatchService _service;
  int _currentPage = 0;
  bool _isLoading = false;

  MatchUsersNotifier(this._service) : super(MatchState.initial());

  Future<void> loadMatches({bool refresh = false}) async {
    if (_isLoading) return;

    _isLoading = true;
    state = state.copyWith(isLoading: true, error: null);

    try {
      final userId = SupabaseService.currentUserId;
      if (userId == null) {
        state = state.copyWith(
          isLoading: false,
          error: '用户未登录',
        );
        return;
      }

      if (refresh) {
        _currentPage = 0;
      }

      final settings = await _service.getMatchSettings(userId);
      final users = await _service.findMatches(
        currentUserId: userId,
        settings: settings,
        page: _currentPage,
      );

      if (refresh) {
        state = state.copyWith(
          users: users,
          isLoading: false,
          hasMore: users.length == 20,
          currentIndex: 0,
        );
      } else {
        state = state.copyWith(
          users: [...state.users, ...users],
          isLoading: false,
          hasMore: users.length == 20,
        );
      }

      _currentPage++;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    } finally {
      _isLoading = false;
    }
  }

  Future<void> handleSwipe(SwipeDirection direction) async {
    final currentUser = state.users[state.currentIndex];
    final userId = SupabaseService.currentUserId;

    if (userId == null) return;

    try {
      await _service.handleSwipe(
        currentUserId: userId,
        targetUserId: currentUser.id,
        direction: direction,
      );

      // 移动到下一个
      if (state.currentIndex < state.users.length - 1) {
        state = state.copyWith(currentIndex: state.currentIndex + 1);
      } else if (state.hasMore) {
        // 加载更多
        await loadMatches();
      }
    } catch (e) {
      print('Handle swipe error: $e');
    }
  }

  void nextCard() {
    if (state.currentIndex < state.users.length - 1) {
      state = state.copyWith(currentIndex: state.currentIndex + 1);
    }
  }

  MatchUser? get currentUser {
    if (state.users.isEmpty || state.currentIndex >= state.users.length) {
      return null;
    }
    return state.users[state.currentIndex];
  }
}

// 当前匹配用户Provider（用于UI显示）
final currentMatchUserProvider = Provider<MatchUser?>((ref) {
  final matchState = ref.watch(matchUsersProvider);
  if (matchState.users.isEmpty ||
      matchState.currentIndex >= matchState.users.length) {
    return null;
  }
  return matchState.users[matchState.currentIndex];
});
