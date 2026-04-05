import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_theme.dart';
import '../../match/models/match_models.dart';
import '../../match/providers/match_provider.dart';

class MatchSettingsScreen extends ConsumerStatefulWidget {
  const MatchSettingsScreen({super.key});

  @override
  ConsumerState<MatchSettingsScreen> createState() => _MatchSettingsScreenState();
}

class _MatchSettingsScreenState extends ConsumerState<MatchSettingsScreen> {
  late MatchSettings _settings;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _settings = MatchSettings.defaultSettings();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final settingsAsync = await ref.read(matchSettingsProvider.future);
    if (mounted) {
      setState(() => _settings = settingsAsync);
    }
  }

  Future<void> _saveSettings() async {
    setState(() => _isSaving = true);

    try {
      final service = ref.read(matchServiceProvider);
      // TODO: Get current user ID
      await service.updateMatchSettings(
        userId: 'current_user_id',
        settings: _settings,
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('设置已保存')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('保存失败: $e')),
        );
      }
    } finally {
      setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('匹配设置'),
        actions: [
          TextButton(
            onPressed: _isSaving ? null : _saveSettings,
            child: _isSaving
                ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Text('保存'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('匹配值设置'),
            _buildMatchScoreSlider(),
            SizedBox(height: 24.h),
            _buildSectionTitle('性别筛选'),
            _buildGenderSelector(),
            SizedBox(height: 24.h),
            _buildSectionTitle('年龄范围'),
            _buildAgeRangeSlider(),
            SizedBox(height: 24.h),
            _buildSectionTitle('位置范围'),
            _buildLocationSelector(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }

  Widget _buildMatchScoreSlider() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('最小匹配值'),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Text(
                    '${_settings.minMatchScore}',
                    style: TextStyle(
                      color: AppTheme.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Slider(
              value: _settings.minMatchScore.toDouble(),
              min: 1,
              max: 10,
              divisions: 9,
              activeColor: AppTheme.primaryColor,
              onChanged: (value) {
                setState(() {
                  _settings = _settings.copyWith(minMatchScore: value.toInt());
                });
              },
            ),
            Text(
              '只显示匹配值大于等于此值的用户',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppTheme.textSecondary,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGenderSelector() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            _buildGenderOption('全部', 'all', Icons.people),
            Divider(height: 1.h),
            _buildGenderOption('男生', 'male', Icons.male),
            Divider(height: 1.h),
            _buildGenderOption('女生', 'female', Icons.female),
          ],
        ),
      ),
    );
  }

  Widget _buildGenderOption(String label, String value, IconData icon) {
    final isSelected = _settings.targetGender == value;
    return ListTile(
      leading: Icon(
        icon,
        color: isSelected ? AppTheme.primaryColor : AppTheme.textSecondary,
      ),
      title: Text(label),
      trailing: isSelected
          ? Icon(Icons.check_circle, color: AppTheme.primaryColor)
          : null,
      onTap: () {
        setState(() {
          _settings = _settings.copyWith(targetGender: value);
        });
      },
    );
  }

  Widget _buildAgeRangeSlider() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${_settings.minAge}岁'),
                Text('${_settings.maxAge}岁'),
              ],
            ),
            SizedBox(height: 8.h),
            RangeSlider(
              values: RangeValues(
                _settings.minAge.toDouble(),
                _settings.maxAge.toDouble(),
              ),
              min: 18,
              max: 60,
              divisions: 42,
              activeColor: AppTheme.primaryColor,
              onChanged: (values) {
                setState(() {
                  _settings = _settings.copyWith(
                    minAge: values.start.toInt(),
                    maxAge: values.end.toInt(),
                  );
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationSelector() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            _buildLocationOption('同城', 'same_city', Icons.location_on),
            Divider(height: 1.h),
            _buildLocationOption('全国', 'nationwide', Icons.public),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationOption(String label, String value, IconData icon) {
    final isSelected = _settings.locationType == value;
    return ListTile(
      leading: Icon(
        icon,
        color: isSelected ? AppTheme.primaryColor : AppTheme.textSecondary,
      ),
      title: Text(label),
      trailing: isSelected
          ? Icon(Icons.check_circle, color: AppTheme.primaryColor)
          : null,
      onTap: () {
        setState(() {
          _settings = _settings.copyWith(locationType: value);
        });
      },
    );
  }
}
