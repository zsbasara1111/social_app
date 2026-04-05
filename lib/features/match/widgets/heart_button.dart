import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_theme.dart';
import '../models/heart_models.dart';
import '../providers/heart_provider.dart';

/// 心形按钮组件
class HeartButton extends ConsumerStatefulWidget {
  final String targetUserId;
  final HeartButtonStyle style;
  final VoidCallback? onStatusChanged;

  const HeartButton({
    super.key,
    required this.targetUserId,
    this.style = HeartButtonStyle.floating,
    this.onStatusChanged,
  });

  @override
  ConsumerState<HeartButton> createState() => _HeartButtonState();
}

class _HeartButtonState extends ConsumerState<HeartButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _bounceAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.0, end: 1.5)
            .chain(CurveTween(curve: Curves.easeOut)),
        weight: 40,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.5, end: 1.0)
            .chain(CurveTween(curve: Curves.elasticOut)),
        weight: 60,
      ),
    ]).animate(_animationController);

    _bounceAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).chain(CurveTween(curve: Curves.elasticOut)).animate(_animationController);

    // 监听状态变化
    Future.microtask(() {
      final state = ref.read(heartStateProvider(widget.targetUserId));
      if (state.status == HeartStatus.mutual) {
        _animationController.forward();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _toggleHeart(HeartStateNotifier notifier, HeartState state) async {
    if (state.isLoading) return;

    switch (state.status) {
      case HeartStatus.none:
      case HeartStatus.received:
        await notifier.sendHeart();
        if (mounted) {
          await _animationController.forward(from: 0);
        }
        break;
      case HeartStatus.sent:
        await notifier.cancelHeart();
        if (mounted) {
          await _animationController.reverse();
        }
        break;
      case HeartStatus.mutual:
        // 互点状态下不能取消，需要显示约会邀请
        break;
    }
    widget.onStatusChanged?.call();
  }

  void _showMutualHeartDialog() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Container(
          padding: EdgeInsets.all(24.w),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppTheme.primaryColor.withValues(alpha: 0.1),
                Colors.white,
              ],
            ),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 跳动的心形
              AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Transform.scale(
                    scale: 1.0 + (_bounceAnimation.value * 0.2),
                    child: Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 80.w,
                    ),
                  );
                },
              ),
              SizedBox(height: 16.h),
              Text(
                '❤️ 你们互相喜欢了！',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textPrimary,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                '现在可以发送约会邀请了~',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppTheme.textSecondary,
                ),
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: AppTheme.primaryColor),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                      ),
                      child: Text(
                        '稍后再说',
                        style: TextStyle(
                          color: AppTheme.primaryColor,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        _showDateInvitationDialog();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                      ),
                      child: Text(
                        '发送邀请',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDateInvitationDialog() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DateInvitationSheet(
        targetUserId: widget.targetUserId,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final heartState = ref.watch(heartStateProvider(widget.targetUserId));
    final notifier = ref.read(heartStateProvider(widget.targetUserId).notifier);

    // 当状态变为mutual时触发动画
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (heartState.status == HeartStatus.mutual &&
          _animationController.status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: _buildButton(heartState, notifier),
        );
      },
    );
  }

  Widget _buildButton(HeartState state, HeartStateNotifier notifier) {
    switch (widget.style) {
      case HeartButtonStyle.floating:
        return _buildFloatingButton(state, notifier);
      case HeartButtonStyle.compact:
        return _buildCompactButton(state, notifier);
      case HeartButtonStyle.large:
        return _buildLargeButton(state, notifier);
    }
  }

  Widget _buildFloatingButton(HeartState state, HeartStateNotifier notifier) {
    Color backgroundColor;
    Color iconColor;
    IconData icon;

    switch (state.status) {
      case HeartStatus.none:
      case HeartStatus.received:
        backgroundColor = Colors.white;
        iconColor = AppTheme.primaryColor;
        icon = Icons.favorite_border;
        break;
      case HeartStatus.sent:
        backgroundColor = AppTheme.primaryColor;
        iconColor = Colors.white;
        icon = Icons.favorite;
        break;
      case HeartStatus.mutual:
        backgroundColor = Colors.red;
        iconColor = Colors.white;
        icon = Icons.favorite;
        break;
    }

    return Material(
      elevation: 4,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: state.status == HeartStatus.mutual
            ? _showMutualHeartDialog
            : () => _toggleHeart(notifier, state),
        customBorder: const CircleBorder(),
        child: Container(
          width: 56.w,
          height: 56.w,
          decoration: BoxDecoration(
            color: backgroundColor,
            shape: BoxShape.circle,
          ),
          child: state.isLoading
              ? Center(
                  child: SizedBox(
                    width: 24.w,
                    height: 24.w,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(iconColor),
                    ),
                  ),
                )
              : Icon(
                  icon,
                  color: iconColor,
                  size: 28.w,
                ),
        ),
      ),
    );
  }

  Widget _buildCompactButton(HeartState state, HeartStateNotifier notifier) {
    Color color;
    IconData icon;
    String label;

    switch (state.status) {
      case HeartStatus.none:
      case HeartStatus.received:
        color = AppTheme.primaryColor;
        icon = Icons.favorite_border;
        label = '喜欢';
        break;
      case HeartStatus.sent:
        color = AppTheme.primaryColor;
        icon = Icons.favorite;
        label = '已喜欢';
        break;
      case HeartStatus.mutual:
        color = Colors.red;
        icon = Icons.favorite;
        label = '互点';
        break;
    }

    return InkWell(
      onTap: state.status == HeartStatus.mutual
          ? _showMutualHeartDialog
          : () => _toggleHeart(notifier, state),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: state.isLoading
            ? SizedBox(
                width: 16.w,
                height: 16.w,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(color),
                ),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    icon,
                    color: color,
                    size: 16.w,
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    label,
                    style: TextStyle(
                      color: color,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildLargeButton(HeartState state, HeartStateNotifier notifier) {
    Color backgroundColor;
    Color textColor;
    IconData icon;
    String label;
    VoidCallback? onTap;

    switch (state.status) {
      case HeartStatus.none:
      case HeartStatus.received:
        backgroundColor = AppTheme.primaryColor;
        textColor = Colors.white;
        icon = Icons.favorite_border;
        label = '发送红心';
        onTap = () => _toggleHeart(notifier, state);
        break;
      case HeartStatus.sent:
        backgroundColor = Colors.grey[300]!;
        textColor = Colors.grey[700]!;
        icon = Icons.favorite;
        label = '取消红心';
        onTap = () => _toggleHeart(notifier, state);
        break;
      case HeartStatus.mutual:
        backgroundColor = Colors.red;
        textColor = Colors.white;
        icon = Icons.favorite;
        label = '❤️ 互点 - 发送约会';
        onTap = _showMutualHeartDialog;
        break;
    }

    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(28.r),
      child: InkWell(
        onTap: state.isLoading ? null : onTap,
        borderRadius: BorderRadius.circular(28.r),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(28.r),
          ),
          child: state.isLoading
              ? SizedBox(
                  width: 20.w,
                  height: 20.w,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(textColor),
                  ),
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icon,
                      color: textColor,
                      size: 20.w,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      label,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

/// 心形按钮样式
enum HeartButtonStyle {
  floating,  // 悬浮圆形按钮
  compact,   // 紧凑标签按钮
  large,     // 大尺寸操作按钮
}

/// 约会邀请底部弹窗
class DateInvitationSheet extends StatefulWidget {
  final String targetUserId;

  const DateInvitationSheet({
    super.key,
    required this.targetUserId,
  });

  @override
  State<DateInvitationSheet> createState() => _DateInvitationSheetState();
}

class _DateInvitationSheetState extends State<DateInvitationSheet> {
  final _messageController = TextEditingController();
  DateTime? _selectedDate;
  String? _selectedLocation;
  bool _isLoading = false;

  final List<String> _presetLocations = [
    '咖啡厅',
    '餐厅',
    '电影院',
    '公园',
    '书店',
    '艺术展',
    '健身房',
    '其他',
  ];

  final List<String> _presetMessages = [
    '很高兴认识你，希望能有机会一起喝杯咖啡~',
    '我们对爱好的品味很相似，想不想一起聊聊？',
    '周末有空吗？想邀请你一起出去玩',
    '你的资料很吸引我，期待能见面交流',
  ];

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _selectDate() async {
    final now = DateTime.now();
    final date = await showDatePicker(
      context: context,
      initialDate: now.add(const Duration(days: 1)),
      firstDate: now,
      lastDate: now.add(const Duration(days: 30)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppTheme.primaryColor,
            ),
          ),
          child: child!,
        );
      },
    );

    if (date != null) {
      final time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: 19, minute: 0),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: AppTheme.primaryColor,
              ),
            ),
            child: child!,
          );
        },
      );

      if (time != null) {
        setState(() {
          _selectedDate = DateTime(
            date.year,
            date.month,
            date.day,
            time.hour,
            time.minute,
          );
        });
      }
    }
  }

  void _showMessagePicker() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '选择快捷消息',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: AppTheme.textPrimary,
              ),
            ),
            SizedBox(height: 16.h),
            ..._presetMessages.map((message) => ListTile(
              title: Text(
                message,
                style: TextStyle(fontSize: 14.sp),
              ),
              onTap: () {
                _messageController.text = message;
                Navigator.pop(context);
              },
            )),
          ],
        ),
      ),
    );
  }

  Future<void> _sendInvitation() async {
    if (_messageController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('请填写邀请信息')),
      );
      return;
    }

    setState(() => _isLoading = true);

    // TODO: 调用服务发送邀请
    await Future.delayed(const Duration(seconds: 1));

    setState(() => _isLoading = false);

    if (mounted) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('约会邀请已发送！')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 拖拽指示器
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 12.h),
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 标题
                Row(
                  children: [
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 28.w,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      '发送约会邀请',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.textPrimary,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Text(
                  '你们已经互相喜欢了，现在可以发起约会邀请~',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppTheme.textSecondary,
                  ),
                ),
                SizedBox(height: 24.h),

                // 时间选择
                Text(
                  '约会时间',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.textPrimary,
                  ),
                ),
                SizedBox(height: 8.h),
                InkWell(
                  onTap: _selectDate,
                  child: Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[300]!),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          color: AppTheme.primaryColor,
                          size: 20.w,
                        ),
                        SizedBox(width: 12.w),
                        Text(
                          _selectedDate != null
                              ? '${_selectedDate!.month}月${_selectedDate!.day}日 ${_selectedDate!.hour.toString().padLeft(2, '0')}:${_selectedDate!.minute.toString().padLeft(2, '0')}'
                              : '选择约会时间',
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: _selectedDate != null
                                ? AppTheme.textPrimary
                                : AppTheme.textLight,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.h),

                // 地点选择
                Text(
                  '约会地点',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.textPrimary,
                  ),
                ),
                SizedBox(height: 8.h),
                Wrap(
                  spacing: 8.w,
                  runSpacing: 8.h,
                  children: _presetLocations.map((location) {
                    final isSelected = _selectedLocation == location;
                    return ChoiceChip(
                      label: Text(location),
                      selected: isSelected,
                      onSelected: (selected) {
                        setState(() {
                          _selectedLocation = selected ? location : null;
                        });
                      },
                      selectedColor: AppTheme.primaryColor.withValues(alpha: 0.2),
                      backgroundColor: Colors.grey[100],
                      labelStyle: TextStyle(
                        color: isSelected ? AppTheme.primaryColor : AppTheme.textSecondary,
                        fontSize: 13.sp,
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20.h),

                // 邀请消息
                Text(
                  '邀请消息',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.textPrimary,
                  ),
                ),
                SizedBox(height: 8.h),
                TextField(
                  controller: _messageController,
                  maxLines: 3,
                  maxLength: 100,
                  decoration: InputDecoration(
                    hintText: '写点什么，让对方知道你的诚意...',
                    hintStyle: TextStyle(
                      fontSize: 14.sp,
                      color: AppTheme.textLight,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide(color: AppTheme.primaryColor),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.lightbulb_outline,
                        color: AppTheme.primaryColor,
                        size: 20.w,
                      ),
                      onPressed: _showMessagePicker,
                    ),
                  ),
                ),
                SizedBox(height: 24.h),

                // 发送按钮
                SizedBox(
                  width: double.infinity,
                  height: 50.h,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _sendInvitation,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    child: _isLoading
                        ? SizedBox(
                            width: 20.w,
                            height: 20.w,
                            child: const CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                        : Text(
                            '发送邀请',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
