# 应用商店提交指南

## 准备工作清单

### 开发者账号
- [ ] Apple Developer Program ($99/年)
- [ ] Google Play Developer ($25一次性)

### 应用资料准备
- [ ] 隐私政策 URL（可使用 GitHub Pages 或自有域名）
- [ ] 支持网站 URL
- [ ] 联系邮箱
- [ ] 客服电话（可选）

---

## iOS App Store 提交流程

### 1. 准备工作

#### 证书与描述文件
1. 登录 [Apple Developer Portal](https://developer.apple.com/)
2. 创建 App ID（Bundle Identifier）
3. 生成发布证书（Distribution Certificate）
4. 创建 Ad Hoc 和 App Store 描述文件

#### 应用配置
```bash
# 设置 Bundle ID
# 在 Xcode 中打开 ios/Runner.xcworkspace

# 配置签名
# Xcode > Runner > Signing & Capabilities
# - 选择 Team
# - 确认 Bundle Identifier
# - 自动管理签名
```

### 2. 构建与上传

#### 使用 Xcode 上传
```bash
# 1. 打开 Xcode
cd ios && open Runner.xcworkspace

# 2. 选择 Product > Archive

# 3. 等待归档完成后，选择 Distribute App

# 4. 选择 App Store Connect > Upload
```

#### 使用命令行上传
```bash
# 构建 iOS 发布版本
flutter build ios --release

# 进入 Xcode 归档
cd ios && xcodebuild -workspace Runner.xcworkspace \
  -scheme Runner \
  -sdk iphoneos \
  -configuration Release \
  archive -archivePath $PWD/build/Runner.xcarchive
```

### 3. App Store Connect 配置

1. 登录 [App Store Connect](https://appstoreconnect.apple.com/)
2. 创建新 App
   - 平台：iOS
   - 名称：缘分社交
   - 主要语言：简体中文
   - Bundle ID：选择创建的 ID
   - SKU：yuanfen-social-001

3. 填写应用信息
   - 隐私政策 URL
   - 类别：社交 - 约会
   - 年龄分级：17+

4. 上传截图（按规格）
5. 填写描述、关键词、技术支持信息
6. 配置应用内购买（如有）

### 4. 提交审核

- 填写审核备注（提供测试账号）
- 提交审核
- 等待 1-3 个工作日

---

## Android Google Play 提交流程

### 1. 准备工作

#### 密钥库生成
```bash
# 生成签名密钥（如尚未生成）
keytool -genkey -v \
  -keystore yuanfen-social-key.jks \
  -keyalg RSA \
  -keysize 2048 \
  -validity 10000 \
  -alias yuanfen
```

#### 配置签名
创建 `android/key.properties`：
```properties
storePassword=your_store_password
keyPassword=your_key_password
keyAlias=yuanfen
storeFile=../yuanfen-social-key.jks
```

#### 配置 build.gradle
在 `android/app/build.gradle`：
```gradle
android {
    ...
    signingConfigs {
        release {
            keyAlias keystoreProperties['keyAlias']
            keyPassword keystoreProperties['keyPassword']
            storeFile keystoreProperties['storeFile'] ? file(keystoreProperties['storeFile']) : null
            storePassword keystoreProperties['storePassword']
        }
    }
    buildTypes {
        release {
            signingConfig signingConfigs.release
            minifyEnabled true
            shrinkResources true
            proguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguard-rules.pro'
        }
    }
}
```

### 2. 构建 AAB

```bash
# 构建 Android App Bundle（推荐）
flutter build appbundle --release

# 输出位置：build/app/outputs/bundle/release/app-release.aab

# 或构建 APK（用于测试）
flutter build apk --release

# 输出位置：build/app/outputs/apk/release/app-release.apk
```

### 3. Google Play Console 配置

1. 登录 [Google Play Console](https://play.google.com/console/)
2. 创建新应用
   - 应用名称：缘分社交
   - 默认语言：中文（简体）
   - 应用类型：应用
   - 付费/免费：免费

3. 设置应用
   - 商店列表
   - 应用内容（内容分级问卷）
   - 定价与分发范围

4. 上传 AAB 文件

### 4. 内容分级问卷

填写内容分级问卷，主要涉及：
- 约会内容：是
- 位置共享：是
- 用户生成内容：是
- 社交互动：是

预期分级：Mature 17+

### 5. 发布

- 选择发布轨道（内部测试/公开测试/正式版）
- 提交审核
- Google Play 审核通常需要 1-3 天

---

## 测试账号配置

### 应用内预设测试账号

在 `lib/core/constants/test_accounts.dart`：

```dart
class TestAccounts {
  static const List<Map<String, dynamic>> accounts = [
    {
      'phone': '13800138000',
      'code': '123456',
      'nickname': '测试用户A',
      'hobbies': ['摄影', '旅行', '美食'],
      'description': '用于展示完整功能',
    },
    {
      'phone': '13800138001',
      'code': '123456',
      'nickname': '测试用户B',
      'hobbies': ['音乐', '电影', '阅读'],
      'description': '用于匹配流程测试',
    },
  ];
}
```

### 审核备注模板

```
测试账号信息：

账号1：13800138000，验证码：123456
- 已完善个人资料（头像、照片、爱好标签）
- 可用于测试匹配、聊天、约会邀请功能

账号2：13800138001，验证码：123456
- 已发送红心与账号1互点
- 可用于测试互点后的约会邀请流程

注意事项：
- 测试环境使用模拟数据
- 位置功能使用固定测试位置
- 推送通知仅在真机测试时有效
```

---

## 常见问题与应对

### iOS 审核被拒原因

| 原因 | 解决方案 |
|------|----------|
| 4.2 功能不足 | 确保核心功能完整可用 |
| 4.3 重复应用 | 强调爱好匹配的独特性 |
| 5.1.1 隐私政策 | 确保隐私政策完整且可访问 |
| 1.2 用户生成内容 | 添加举报和屏蔽功能 |
| 2.3.3 元数据不准确 | 确保截图和描述真实反映功能 |

### Google Play 审核被拒原因

| 原因 | 解决方案 |
|------|----------|
| 内容分级不准确 | 如实填写内容分级问卷 |
| 隐私政策缺失 | 提供完整隐私政策链接 |
| 权限声明不当 | 仅请求必要的权限 |
| 崩溃或无响应 | 确保应用稳定运行 |

---

## 发布后维护

### 版本更新

#### iOS
```bash
# 1. 更新版本号（pubspec.yaml）
version: 1.0.1+2

# 2. 构建并上传
flutter build ios --release
# Xcode > Product > Archive
```

#### Android
```bash
# 1. 更新版本号
version: 1.0.1+2

# 2. 构建
flutter build appbundle --release

# 3. 上传新版本到 Play Console
```

### 用户反馈处理

1. 定期查看应用商店评论
2. 及时回复用户问题
3. 收集功能建议
4. 快速修复严重 bug

---

## 联系方式

- **技术支持**：support@yuanfen.social
- **商务合作**：business@yuanfen.social
- **紧急情况**：urgent@yuanfen.social

---

**祝上架顺利！🎉**
