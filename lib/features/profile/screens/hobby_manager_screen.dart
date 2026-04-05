import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_theme.dart';

class HobbyManagerScreen extends StatelessWidget {
  const HobbyManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('爱好管理'),
        actions: [
          TextButton(
            onPressed: () => context.push('/hobby-select'),
            child: const Text('添加'),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.interests_outlined,
              size: 80.w,
              color: AppTheme.textLight,
            ),
            SizedBox(height: 16.h),
            Text(
              '还没有添加爱好',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppTheme.textSecondary,
                  ),
            ),
            SizedBox(height: 8.h),
            TextButton(
              onPressed: () => context.push('/hobby-select'),
              child: const Text('添加爱好'),
            ),
          ],
        ),
      ),
    );
  }
}
