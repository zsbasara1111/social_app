import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../core/theme/app_theme.dart';
import '../models/post_models.dart';
import '../providers/feed_provider.dart';

class PostCard extends ConsumerWidget {
  final Post post;

  const PostCard({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 头部：用户信息
          _buildHeader(context),

          // 内容
          if (post.content.isNotEmpty)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              child: Text(
                post.content,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppTheme.textPrimary,
                  height: 1.5,
                ),
              ),
            ),

          // 图片
          if (post.images.isNotEmpty)
            _buildImageGrid(),

          // 位置
          if (post.location != null)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on,
                    size: 14.w,
                    color: AppTheme.textLight,
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    post.location!,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppTheme.textLight,
                    ),
                  ),
                ],
              ),
            ),

          // 底部：时间和互动
          _buildFooter(context, ref),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: post.userAvatar != null
            ? NetworkImage(post.userAvatar!)
            : null,
        backgroundColor: Colors.grey[300],
        child: post.userAvatar == null
            ? Icon(Icons.person, color: Colors.grey[600])
            : null,
      ),
      title: Text(
        post.userNickname ?? '匿名用户',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14.sp,
        ),
      ),
      subtitle: Text(
        post.createdAt != null
            ? timeago.format(post.createdAt!, locale: 'zh')
            : '',
        style: TextStyle(
          fontSize: 12.sp,
          color: AppTheme.textLight,
        ),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.more_vert),
        onPressed: () {
          _showOptionsMenu(context);
        },
      ),
    );
  }

  Widget _buildImageGrid() {
    if (post.images.length == 1) {
      return _buildSingleImage(post.images.first);
    } else if (post.images.length == 2 || post.images.length == 4) {
      return _buildGridImages(2);
    } else {
      return _buildGridImages(3);
    }
  }

  Widget _buildSingleImage(String url) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.r),
        child: CachedNetworkImage(
          imageUrl: url,
          fit: BoxFit.cover,
          width: double.infinity,
          height: 200.h,
          placeholder: (context, url) => Container(
            color: Colors.grey[200],
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          errorWidget: (context, url, error) => Container(
            color: Colors.grey[200],
            child: const Icon(Icons.error),
          ),
        ),
      ),
    );
  }

  Widget _buildGridImages(int crossAxisCount) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 4.w,
          mainAxisSpacing: 4.w,
        ),
        itemCount: post.images.length,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(4.r),
            child: CachedNetworkImage(
              imageUrl: post.images[index],
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                color: Colors.grey[200],
              ),
              errorWidget: (context, url, error) => Container(
                color: Colors.grey[200],
                child: const Icon(Icons.error),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFooter(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      child: Row(
        children: [
          // 点赞
          _buildActionButton(
            icon: post.isLiked ? Icons.favorite : Icons.favorite_border,
            color: post.isLiked ? AppTheme.error : AppTheme.textLight,
            count: post.likeCount,
            onTap: () {
              ref.read(feedPostsProvider.notifier).toggleLike(post.id);
            },
          ),
          SizedBox(width: 16.w),
          // 评论
          _buildActionButton(
            icon: Icons.chat_bubble_outline,
            color: AppTheme.textLight,
            count: post.commentCount,
            onTap: () {
              // TODO: 打开评论
            },
          ),
          SizedBox(width: 16.w),
          // 分享
          _buildActionButton(
            icon: Icons.share_outlined,
            color: AppTheme.textLight,
            onTap: () {
              // TODO: 分享
            },
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required Color color,
    int? count,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, color: color, size: 20.w),
          if (count != null) ...[
            SizedBox(width: 4.w),
            Text(
              count.toString(),
              style: TextStyle(
                color: AppTheme.textLight,
                fontSize: 12.sp,
              ),
            ),
          ],
        ],
      ),
    );
  }

  void _showOptionsMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.report_outlined),
              title: const Text('举报'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            if (post.userId == 'current_user')
              ListTile(
                leading: const Icon(Icons.delete_outline, color: AppTheme.error),
                title: const Text('删除', style: TextStyle(color: AppTheme.error)),
                onTap: () {
                  Navigator.pop(context);
                  // TODO: 删除动态
                },
              ),
          ],
        ),
      ),
    );
  }
}
