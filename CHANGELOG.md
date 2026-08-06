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
- 英文版扩充：新增 Summary 段、FoxSay 项目（此前缺失），毕设条目同步为
  模型优化四条结构；整体压缩排版（边距 0.6in/0.4in、标题间距、行距 0.88）
  维持单页。 (`feat`, `hybrid`)
- 新增「毕业设计 | 电解水气泡识别检测模型开发」并置顶于项目经历，替换
  创享商圈 ROBOT-XZC；模型优化拆分展开为检测模型/分割扩展两条；项目经历
  提前至校园实践之上；竞赛获奖改单段内联排版；FoxSay 措辞压缩；英文版
  同步；移除已过期的“预计2026年6月毕业”。 (`feat`, `hybrid`)
- 重建仓库文档体系：新增 `AGENTS.md` 与本 `CHANGELOG.md`，重写 `README.md`
  ，统一规范自动/手动两种修改记录模式。 (`docs`, `hybrid`)

### Chore
- 新增 `make export`：编译并导出带日期命名的交付副本
  （`王海翔-简历-YYYYMMDD.pdf` / `JackWang-Resume-YYYYMMDD.pdf`）至
  `export/` 目录（已 gitignore）。 (`chore`, `agent`)
- 修复 `Makefile` 的 `clean` 误删仓库根目录所有 PDF（含论文）的问题：
  `clean` 仅清理编译中间产物，`make all` 不再依赖 clean。 (`fix`, `agent`)
- 配置本机（macOS arm64）LaTeX 编译环境：安装 BasicTeX 2026 + poppler，
  tlmgr 补齐 `xecjk` / `xltxtra` / `realscripts` / `ifmtarg` 等宏包并免 sudo
  化；修复 `Makefile` 失效的 `en` 目标（原指向不存在的 `resume.tex`）；
  README 补充 macOS 快速配置与完整 tlmgr 安装清单；中英双版 PDF 重新编译
  入库。 (`chore`, `agent`)

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
