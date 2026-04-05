import 'package:freezed_annotation/freezed_annotation.dart';

part 'hobby_models.freezed.dart';
part 'hobby_models.g.dart';

/// 爱好分类模型
@freezed
class HobbyCategory with _$HobbyCategory {
  const factory HobbyCategory({
    required String id,
    required String name,
    String? icon,
    @Default(false) bool isCustom,
    @Default(true) bool isPreset,
    DateTime? createdAt,
  }) = _HobbyCategory;

  factory HobbyCategory.fromJson(Map<String, dynamic> json) =>
      _$HobbyCategoryFromJson(json);
}

/// 用户爱好作品模型
@freezed
class UserHobbyItem with _$UserHobbyItem {
  const factory UserHobbyItem({
    required String id,
    required String userId,
    required String categoryId,
    required String itemName,
    String? categoryName,
    DateTime? createdAt,
  }) = _UserHobbyItem;

  factory UserHobbyItem.fromJson(Map<String, dynamic> json) =>
      _$UserHobbyItemFromJson(json);
}

/// 爱好选择状态
@freezed
class HobbySelectionState with _$HobbySelectionState {
  const factory HobbySelectionState({
    @Default({}) Map<String, List<String>> selectedItems,
    @Default(false) bool isLoading,
    @Default(false) bool isSaving,
    String? error,
  }) = _HobbySelectionState;

  factory HobbySelectionState.initial() => const HobbySelectionState();
}

/// 预设的19个爱好分类及热门作品
class PresetHobbies {
  static const List<String> categories = [
    '书籍',
    '音乐',
    '游戏',
    '电影',
    '剧集',
    '综艺',
    '桌游',
    '美食',
    '饮品',
    '艺术',
    '运动',
    '宠物',
    '动画',
    '漫画',
    '播客',
    '学习',
    '歌手',
    '演员',
    '艺人',
  ];

  static const Map<String, List<String>> popularItems = {
    '书籍': ['三体', '百年孤独', '活着', '1984', '小王子', '红楼梦', '围城'],
    '音乐': ['周杰伦', 'Taylor Swift', '陈奕迅', '林俊杰', '薛之谦', '邓紫棋'],
    '游戏': ['原神', '王者荣耀', '黑神话：悟空', '塞尔达', '双人成行', '星露谷物语'],
    '电影': ['星际穿越', '肖申克的救赎', '千与千寻', '霸王别姬', '阿甘正传'],
    '剧集': ['狂飙', '漫长的季节', '权力的游戏', '老友记', '绝命毒师', '请回答1988'],
    '综艺': ['乘风破浪的姐姐', '乐队的夏天', '脱口秀大会', '奇葩说'],
    '桌游': ['狼人杀', '剧本杀', '三国杀', 'UNO', '卡坦岛', '阿瓦隆'],
    '美食': ['火锅', '烧烤', '日料', '韩餐', '川菜', '粤菜', '烘焙'],
    '饮品': ['奶茶', '咖啡', '精酿啤酒', '鸡尾酒', '清酒', '威士忌'],
    '艺术': ['油画', '素描', '摄影', '书法', '陶艺', '插花'],
    '运动': ['跑步', '瑜伽', '游泳', '健身', '篮球', '羽毛球', '滑雪'],
    '宠物': ['猫', '狗', '仓鼠', '兔子', '爬宠', '水族'],
    '动画': ['进击的巨人', '咒术回战', '间谍过家家', '鬼灭之刃', '海贼王'],
    '漫画': ['一人之下', '镖人', '刺客伍六七', '罗小黑战记', '镇魂街'],
    '播客': ['忽左忽右', '文化有限', '随机波动', '谐星聊天会', '梁文道'],
    '学习': ['英语', '日语', '编程', '心理学', '经济学', '哲学', '历史'],
    '歌手': ['周杰伦', '林俊杰', '陈奕迅', '薛之谦', '邓紫棋', 'Taylor Swift'],
    '演员': ['刘亦菲', '胡歌', '张译', '朱一龙', '周冬雨', '易烊千玺'],
    '艺人': ['王一博', '张艺兴', '王嘉尔', 'Lisa', '蔡徐坤', '肖战'],
  };
}
