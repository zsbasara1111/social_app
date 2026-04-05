import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_theme.dart';

class HobbySelectScreen extends StatefulWidget {
  final bool isRegistration;

  const HobbySelectScreen({
    super.key,
    this.isRegistration = false,
  });

  @override
  State<HobbySelectScreen> createState() => _HobbySelectScreenState();
}

class _HobbySelectScreenState extends State<HobbySelectScreen> {
  final Map<String, List<String>> _selectedHobbies = {};
  String? _currentCategory;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('选择爱好'),
        actions: [
          TextButton(
            onPressed: _completeSelection,
            child: const Text('完成'),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '选择你感兴趣的作品',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                SizedBox(height: 8.h),
                Text(
                  '选择越多，匹配越精准',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppTheme.textSecondary,
                      ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: AppConstants.presetHobbyCategories.length,
              itemBuilder: (context, index) {
                final category = AppConstants.presetHobbyCategories[index];
                final selectedCount = _selectedHobbies[category]?.length ?? 0;

                return ListTile(
                  leading: _getCategoryIcon(category),
                  title: Text(category),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (selectedCount > 0)
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppTheme.primaryColor,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Text(
                            '$selectedCount',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      SizedBox(width: 8.w),
                      const Icon(Icons.chevron_right),
                    ],
                  ),
                  onTap: () => _showHobbyDetail(category),
                );
              },
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _completeSelection,
                  child: _isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : Text(widget.isRegistration ? '进入应用' : '保存'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getCategoryIcon(String category) {
    IconData iconData;
    switch (category) {
      case '书籍':
        iconData = Icons.book_outlined;
        break;
      case '音乐':
      case '歌手':
        iconData = Icons.music_note_outlined;
        break;
      case '游戏':
        iconData = Icons.sports_esports_outlined;
        break;
      case '电影':
      case '剧集':
      case '演员':
        iconData = Icons.movie_outlined;
        break;
      case '综艺':
      case '艺人':
        iconData = Icons.live_tv_outlined;
        break;
      case '美食':
        iconData = Icons.restaurant_outlined;
        break;
      case '运动':
        iconData = Icons.sports_outlined;
        break;
      case '宠物':
        iconData = Icons.pets_outlined;
        break;
      case '艺术':
        iconData = Icons.palette_outlined;
        break;
      default:
        iconData = Icons.interests_outlined;
    }
    return Icon(iconData, color: AppTheme.primaryColor);
  }

  void _showHobbyDetail(String category) {
    // TODO: Show hobby detail page with search and selection
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.9,
        minChildSize: 0.5,
        maxChildSize: 0.9,
        expand: false,
        builder: (context, scrollController) {
          return HobbyDetailSheet(
            category: category,
            selectedItems: _selectedHobbies[category] ?? [],
            onSelectionChanged: (items) {
              setState(() {
                if (items.isEmpty) {
                  _selectedHobbies.remove(category);
                } else {
                  _selectedHobbies[category] = items;
                }
              });
            },
          );
        },
      ),
    );
  }

  Future<void> _completeSelection() async {
    if (_selectedHobbies.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('请至少选择一个爱好')),
      );
      return;
    }

    setState(() => _isLoading = true);

    // TODO: Save hobbies to backend
    await Future.delayed(const Duration(seconds: 1));

    setState(() => _isLoading = false);

    if (mounted) {
      if (widget.isRegistration) {
        context.go('/match');
      } else {
        context.pop();
      }
    }
  }
}

class HobbyDetailSheet extends StatefulWidget {
  final String category;
  final List<String> selectedItems;
  final Function(List<String>) onSelectionChanged;

  const HobbyDetailSheet({
    super.key,
    required this.category,
    required this.selectedItems,
    required this.onSelectionChanged,
  });

  @override
  State<HobbyDetailSheet> createState() => _HobbyDetailSheetState();
}

class _HobbyDetailSheetState extends State<HobbyDetailSheet> {
  late List<String> _selectedItems;
  final _searchController = TextEditingController();

  // Example popular items for each category
  final Map<String, List<String>> _popularItems = {
    '书籍': ['三体', '百年孤独', '活着', '1984', '小王子'],
    '音乐': ['周杰伦', 'Taylor Swift', '陈奕迅', '林俊杰', '薛之谦'],
    '游戏': ['原神', '王者荣耀', '黑神话：悟空', '塞尔达', '双人成行'],
    '电影': ['星际穿越', '肖申克的救赎', '千与千寻', '霸王别姬'],
    '剧集': ['狂飙', '漫长的季节', '权力的游戏', '老友记'],
    '动画': ['进击的巨人', '咒术回战', '间谍过家家', '鬼灭之刃'],
    '歌手': ['周杰伦', '林俊杰', '陈奕迅', '薛之谦', '邓紫棋', 'Taylor Swift'],
    '演员': ['刘亦菲', '胡歌', '张译', '朱一龙', '周冬雨'],
    '艺人': ['王一博', '张艺兴', '王嘉尔', 'Lisa'],
  };

  @override
  void initState() {
    super.initState();
    _selectedItems = List.from(widget.selectedItems);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final popularItems = _popularItems[widget.category] ?? [];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 12.h),
            width: 40.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.category,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    widget.onSelectionChanged(_selectedItems);
                    Navigator.pop(context);
                  },
                  child: const Text('完成'),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.w),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: '搜索作品...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          setState(() {});
                        },
                      )
                    : null,
              ),
              onChanged: (_) => setState(() {}),
            ),
          ),
          Expanded(
            child: _searchController.text.isNotEmpty
                ? _buildSearchResults()
                : _buildPopularItems(popularItems),
          ),
        ],
      ),
    );
  }

  Widget _buildPopularItems(List<String> items) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '热门作品',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          SizedBox(height: 12.h),
          Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: items.map((item) {
              final isSelected = _selectedItems.contains(item);
              return FilterChip(
                label: Text(item),
                selected: isSelected,
                onSelected: (selected) {
                  setState(() {
                    if (selected) {
                      _selectedItems.add(item);
                    } else {
                      _selectedItems.remove(item);
                    }
                  });
                },
                selectedColor: AppTheme.primaryColor.withOpacity(0.2),
                checkmarkColor: AppTheme.primaryColor,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchResults() {
    // TODO: Implement search from backend
    return const Center(
      child: Text('搜索功能开发中...'),
    );
  }
}
