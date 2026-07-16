# Changelog

本文件记录本仓库（个人简历）中所有有意义的改动，包括但不限于：
简历内容更新、模板调整、依赖/编译配置变更、文档维护。

格式参考 [Keep a Changelog](https://keepachangelog.com/zh-CN/1.1.0/)，
本仓库遵循 [Semantic Versioning](https://semver.org/lang/zh-CN/) 的日期化形式
（`YYYY.MM.PATCH`，PATCH 自每次合入递增）。

修改类型（type）约定：

| type | 含义 |
|---|---|
| `Added` | 新增功能/项目/章节 |
| `Changed` | 既有内容修改 |
| `Removed` | 删除内容 |
| `Fixed` | 排版/编译/字体错误修复 |
| `Docs` | 文档/规范更新 |
| `Chore` | 构建/依赖/工具链调整 |

触发方（trigger）约定：

- `agent` — 由 AI 助手（智能体）执行
- `manual` — 由仓库 owner 手动改动
- `hybrid` — 人工+智能体协作

---

## [Unreleased]

### Changed
- 重建仓库文档体系：新增 `AGENTS.md` 与本 `CHANGELOG.md`，重写 `README.md`
  ，统一规范自动/手动两种修改记录模式。 (`docs`, `hybrid`)

## [2025.11.1] - 2025-11-17

### Added
- 初次入库 `resume-en.tex` / `resume-zh_CN.tex` 简历源码。
- 附带 Adobe 宋/楷/黑/仿（部分）四套中文字体与 Fontin/TeX Gyre Termes 拉丁字体。
- 配套 `resume.cls`、`fontawesome.sty`、`linespacing_fix.sty` 模板文件。
- 中英双版本 PDF 渲染产物 `resume-en.pdf` / `resume-zh_CN.pdf` 入库。 (`chore`, `manual`)

## [2025.11.0] - 2025-11-17

### Added
- 从 [hijiangtao/resume](https://github.com/hijiangtao/resume)（fork 自
  [billryan/resume](https://github.com/billryan/resume)）拉取初始模板，作为
  本仓库的起点。 (`added`, `manual`)
