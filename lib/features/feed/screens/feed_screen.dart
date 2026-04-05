import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_theme.dart';
import '../models/post_models.dart';
import '../providers/feed_provider.dart';
import '../widgets/post_card.dart';

class FeedScreen extends ConsumerStatefulWidget {
  const FeedScreen({super.key});

  @override
  ConsumerState<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends ConsumerState<FeedScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_onTabChanged);

    // 初始化加载
    Future.microtask(() {
      ref.read(feedPostsProvider.notifier).loadPosts(
            category: PostCategory.sameCity,
          );
    });

    // 滚动监听
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _tabController.removeListener(_onTabChanged);
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onTabChanged() {
    if (!_tabController.indexIsChanging) {
      final category = _getCategoryFromIndex(_tabController.index);
      ref.read(feedCategoryProvider.notifier).state = category;
      ref.read(feedPostsProvider.notifier).loadPosts(
            category: category,
            refresh: true,
          );
    }
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      ref.read(feedPostsProvider.notifier).loadMore();
    }
  }

  PostCategory _getCategoryFromIndex(int index) {
    switch (index) {
      case 0:
        return PostCategory.sameCity;
      case 1:
        return PostCategory.friends;
      case 2:
        return PostCategory.recommended;
      default:
        return PostCategory.sameCity;
    }
  }

  Future<void> _onRefresh() async {
    final category = ref.read(feedCategoryProvider);
    await ref.read(feedPostsProvider.notifier).loadPosts(
          category: category,
          refresh: true,
        );
  }

  @override
  Widget build(BuildContext context) {
    final feedState = ref.watch(feedPostsProvider);

    return Scaffold(
      appBar: AppBar(
        title: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: '同城'),
            Tab(text: '好友'),
            Tab(text: '推荐'),
          ],
          indicatorColor: AppTheme.primaryColor,
          labelColor: AppTheme.primaryColor,
          unselectedLabelColor: AppTheme.textSecondary,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        color: AppTheme.primaryColor,
        child: feedState.isLoading && feedState.posts.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : feedState.posts.isEmpty
                ? _buildEmptyView()
                : ListView.builder(
                    controller: _scrollController,
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    itemCount: feedState.posts.length +
                        (feedState.hasMore ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == feedState.posts.length) {
                        return Center(
                          child: Padding(
                            padding: EdgeInsets.all(16.w),
                            child: const CircularProgressIndicator(),
                          ),
                        );
                      }
                      return PostCard(post: feedState.posts[index]);
                    },
                  ),
      ),
    );
  }

  Widget _buildEmptyView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.photo_camera_outlined,
            size: 80.w,
            color: AppTheme.textLight,
          ),
          SizedBox(height: 16.h),
          Text(
            '暂无动态',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppTheme.textSecondary,
                ),
          ),
          SizedBox(height: 8.h),
          Text(
            '点击下方按钮发布第一条动态',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppTheme.textLight,
                ),
          ),
        ],
      ),
    );
  }
}