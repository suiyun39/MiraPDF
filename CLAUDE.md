# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 项目概述

MiraPDF 是一个使用 SwiftUI 构建的 macOS PDF 阅读器应用。

## 目录结构

```
MiraPDF/
├── Core/          # 应用核心
├── Features/      # 功能模块
├── Shared/        # 共享组件
│   └── Extensions/  # 扩展
└── Localization/  # 本地化资源
```

## 代码规范

- **最大行长度**: 120 字符
- **缩进**: 2 空格
- **日志**: 使用 `OSLog`
- **本地化**: 所有 UI 字符串使用本地化键
- **文档语言**: 代码注释、提交信息使用中文

## AI 行为限制

1. 仅编辑文本文件（如 `.swift`、`.md` 等）。对于 `.plist`、`.xcodeproj` 等结构化文件，仅告知用户在 Xcode 中的修改方式，不直接编辑

## 功能规划

详见 `README.md`：
1. **基础阅读能力**: 单页/双页/连续滚动、缩略图、目录解析、全局搜索
2. **阅读标注**: 高亮、批注、下划线、形状工具、便签
3. **AI 助手**: 摘要生成、语义搜索、问答
4. **功能增强**: 双语对照、OCR、PDF 分割合并

## 提交规范

使用 Angular Commit Message Convention，但请保持简单。

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

**Type 类型**：
- `feat`: 新功能
- `fix`: 修复 bug
- `docs`: 文档更新
- `style`: 代码格式调整
- `refactor`: 重构
- `perf`: 性能优化
- `test`: 添加测试
- `chore`: 构建过程或辅助工具变更
