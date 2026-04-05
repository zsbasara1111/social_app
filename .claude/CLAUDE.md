# Claude Code 配置

## 自动GitHub同步

本项目已配置自动同步到GitHub。每次提交代码后会自动推送到远程仓库。

### 使用方法

每次修改代码后，只需运行：
```bash
git add .
git commit -m "你的修改说明"
```

代码会自动推送到 https://github.com/zsbasara1111/social_app.git

### 手动同步（备用）

如果自动同步失败，可以手动运行：
```bash
./sync.sh
```

### 项目结构

```
lib/
├── core/           # 核心功能（主题、服务、工具）
├── config/         # 配置文件（路由）
└── features/       # 功能模块
    ├── auth/       # 认证（登录、注册、爱好选择）
    ├── match/      # 匹配系统
    ├── chat/       # 聊天
    ├── feed/       # 动态
    └── profile/    # 个人资料
```

## 开发进度

- [x] Phase 1: 基础框架（登录、注册、资料、导航）
- [x] Phase 2: 爱好匹配系统（爱好选择、匹配算法、卡片滑动）
- [ ] Phase 3: AI话题助手 + 动态系统
- [ ] Phase 4: 红心约会系统
- [ ] Phase 5: 双平台适配与优化
