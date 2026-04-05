import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_theme.dart';
import '../models/match_models.dart';
import '../providers/match_provider.dart';
import '../widgets/match_card.dart';

class MatchScreen extends ConsumerStatefulWidget {
  const MatchScreen({super.key});

  @override
  ConsumerState<MatchScreen> createState() => _MatchScreenState();
}

class _MatchScreenState extends ConsumerState<MatchScreen> {
  @override
  void initState() {
    super.initState();
    // 初始化时加载匹配用户
    Future.microtask(() {
      ref.read(matchUsersProvider.notifier).loadMatches();
    });
  }

  void _showMatchSettings() {
    context.push('/match-settings');
  }

  void _onSwipe(CardSwiperDirection direction) {
    SwipeDirection swipeDirection;
    switch (direction) {
      case CardSwiperDirection.left:
        swipeDirection = SwipeDirection.left;
        break;
      case CardSwiperDirection.right:
        swipeDirection = SwipeDirection.right;
        break;
      case CardSwiperDirection.top:
        swipeDirection = SwipeDirection.up;
        break;
      default:
        return;
    }

    ref.read(matchUsersProvider.notifier).handleSwipe(swipeDirection);
  }

  @override
  Widget build(BuildContext context) {
    final matchState = ref.watch(matchUsersProvider);
    final currentUser = ref.watch(currentMatchUserProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('缘分'),
        actions: [
          IconButton(
            icon: const Icon(Icons.tune),
            onPressed: _showMatchSettings,
          ),
        ],
      ),
      body: matchState.isLoading && matchState.users.isEmpty
          ? _buildLoadingView()
          : matchState.users.isEmpty
              ? _buildEmptyView()
              : _buildMatchCards(matchState, currentUser),
    );
  }

  Widget _buildLoadingView() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildEmptyView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_off,
            size: 80.w,
            color: AppTheme.textLight,
          ),
          SizedBox(height: 16.h),
          Text(
            '暂无匹配用户',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppTheme.textSecondary,
                ),
          ),
          SizedBox(height: 8.h),
          Text(
            '尝试放宽匹配条件试试',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppTheme.textLight,
                ),
          ),
          SizedBox(height: 24.h),
          ElevatedButton(
            onPressed: _showMatchSettings,
            child: const Text('调整设置'),
          ),
        ],
      ),
    );
  }

  Widget _buildMatchCards(MatchState matchState, MatchUser? currentUser) {
    if (currentUser == null) {
      return _buildEmptyView();
    }

    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: CardSwiper(
              cardsCount: matchState.users.length - matchState.currentIndex,
              onSwipe: (previousIndex, currentIndex, direction) {
                _onSwipe(direction);
                return true;
              },
              cardBuilder: (context, index, horizontalOffsetPercentage,
                  verticalOffsetPercentage) {
                final userIndex = matchState.currentIndex + index;
                if (userIndex >= matchState.users.length) {
                  return const SizedBox.shrink();
                }
                final user = matchState.users[userIndex];
                return MatchCard(user: user);
              },
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(24.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildActionButton(
                icon: Icons.close,
                color: AppTheme.error,
                onPressed: () {
                  ref
                      .read(matchUsersProvider.notifier)
                      .handleSwipe(SwipeDirection.left);
                },
              ),
              _buildActionButton(
                icon: Icons.favorite,
                color: AppTheme.success,
                size: 72.w,
                onPressed: () {
                  ref
                      .read(matchUsersProvider.notifier)
                      .handleSwipe(SwipeDirection.right);
                },
              ),
              _buildActionButton(
                icon: Icons.star,
                color: AppTheme.warning,
                onPressed: () {
                  ref
                      .read(matchUsersProvider.notifier)
                      .handleSwipe(SwipeDirection.up);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required Color color,
    double size = 56,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, color: color),
        iconSize: size * 0.4,
        onPressed: onPressed,
      ),
    );
  }
}
