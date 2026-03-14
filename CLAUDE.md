# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 项目概述

MiraPDF 是一个使用 SwiftUI 构建的 macOS PDF 阅读器，旨在为用户提供简洁、易用的 PDF 阅读体验。

## 代码规范

- 统一使用 2 个空格缩进，单行代码不宜超过 120 字符
- 代码注释使用中文，应保持精简、清晰、有效
- 严格遵循 SwiftUI 官方最佳实践
- 应在关键节点、复杂逻辑处使用 `OSLog` 预留日志以方便调试

## 本地化规范

遵循代码优先原则，所使用的 key 由构建工具自动提取，严禁手动添加。

所有的 key 统一使用点分隔结构、使用下划线分隔单词，并遵循如下规则：

- UI 文本：约定为 `module.type.name` 的结构
- 错误消息：约定为 `error.name.type` 的结构，且须声明 `tableName` 以将其提取到 ErrorMessage.xcstrings 中

开发阶段仅需完成简体中文文案，其他语言后续补充。

## 目录结构

```
MiraPDF/
├── Core/            # 应用核心
├── Features/        # 功能模块
├── Shared/          # 共享组件
│   └── Extensions/  # 扩展
└── Localization/    # 本地化资源
```

## AI 行为约束

1. 精简主义、言简意赅、直指核心、不说废话
2. Plan 模式优先，在明确收到指令前不要生成代码写入操作
3. 避免直接修改 `plist`、`xcstrings` 等结构化文件，应仅告知在开发工具中的修改方法
4. 在用户要求生成提交信息时仅需按照提交规范生成提交信息，严禁执行 `git commit` 指令

## 提交规范

提交信息应严格遵循 Angular Commit Message Convention 并尽可能保持简洁，当 description 足以说明此次提交时无需生成 body 和 footer。

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```
