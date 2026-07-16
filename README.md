# 个人简历 · Resume

> **owner**: [王海翔 (JackWPP)](https://github.com/JackWPP)
> **分支**: `master`
> **类型**: 个人私有仓库（个人简历 LaTeX 源码 + 渲染产物）

本仓库是我（王海翔）的个人简历 LaTeX 源码与渲染产物仓库，由
[hijiangtao/resume](https://github.com/hijiangtao/resume)
（再上游 [billryan/resume](https://github.com/billryan/resume)）fork 而来，
并在其基础上做了大量定制以适配：

- 中英双语并行维护
- 单页 A4 硬约束的工程化压缩
- 智能体（AI）协作友好的目录与日志规范

> 简历主入口：[`resume-zh_CN.tex`](./resume-zh_CN.tex) · 英文版：[`resume-en.tex`](./resume-en.tex)
> 渲染产物：[`resume-zh_CN.pdf`](./resume-zh_CN.pdf) · [`resume-en.pdf`](./resume-en.pdf)

---

## 📑 目录

- [快速开始](#快速开始)
- [环境与依赖](#环境与依赖)
- [编译指南](#编译指南)
- [项目结构](#项目结构)
- [修改规范（智能体 + 人工）](#修改规范智能体--人工)
- [Changelog 摘要](#changelog-摘要)
- [致谢与上游](#致谢与上游)
- [License](#license)

---

## 快速开始

```bash
# 1. 克隆（私有仓库，请用你自己的凭证）
git clone https://github.com/JackWPP/resume.git
cd resume

# 2. 编译中文版
xelatex resume-zh_CN.tex

# 3. 编译英文版
xelatex resume-en.tex

# 或使用 Makefile 一键全编
make all
```

> 编译需使用 **XeLaTeX**（不能用 pdfLaTeX），因为模板依赖 `fontspec` +
> `xeCJK` + Adobe 简中字体。详见下节。

---

## 环境与依赖

### 1. 操作系统
任意支持 TeX Live 的系统。已在以下环境验证：

- ✅ Debian 12 / Ubuntu 22.04+（`apt install texlive-xetex texlive-lang-chinese`）
- ✅ macOS 13+（[MacTeX](https://tug.org/mactex/)）
- ✅ Windows 11 + [TeX Live 2023+](https://tug.org/texlive/)
- ⚠️ Overleaf（在线）需把 `fonts/zh_CN-Adobe/` 整个目录上传（默认使用
  `zh_CN-Adobefonts_external` 即可）

### 2. TeX 发行版
**TeX Live 2022 或更新**（建议 2023+）。下列宏包必须可用：

| 宏包 | 用途 | tlmgr 包名 |
|---|---|---|
| `fontspec` | 自定义字体（XeLaTeX 必选） | `fontspec` |
| `xeCJK` | 中日韩字体支持 | `xeCJK` |
| `xcolor` | 颜色 | `xcolor` |
| `xltxtra` | XeLaTeX 工具宏 | `xltxtra` |
| `xifthen` | 条件判断 | `xifthen` |
| `fontawesome` | 图标（[本地版](./fontawesome.sty)） | `fontawesome` |
| `geometry` | 页面尺寸 | `geometry` |
| `titlesec` | section 排版 | `titlesec` |
| `enumitem` | 列表控制 | `enumitem` |
| `setspace` | 行距 | `setspace` |
| `multicol` | 多列布局 | `multicol` |
| `cite` / `natbib` | 参考文献 | `cite` |
| `calc` | 长度计算 | `calc` |

一键安装（Debian/Ubuntu）：

```bash
sudo apt install texlive-xetex texlive-lang-chinese texlive-fonts-recommended \
                 texlive-fonts-extra texlive-latex-extra
```

MacTeX 用户：装好即全。TeX Live minimal 用户：

```bash
tlmgr install fontspec xeCJK xcolor xltxtra xifthen fontawesome geometry \
         titlesec enumitem setspace multicol cite
```

### 3. 字体

模板默认使用**外置字体**（仓库自带，无需系统安装）：

- **拉丁字体**：`fonts/Main/` 下的 TeX Gyre Termes + Fontin SmallCaps
- **中文字体**：`fonts/zh_CN-Adobe/` 下的 Adobe 宋体（`AdobeSongStd-Light.otf`）、
  黑体（`AdobeHeitiStd-Regular.otf`）、楷体（`AdobeKaitiStd-Regular.otf`）。
  > ⚠️ 仿宋体（`AdobeFangsongStd-Regular.otf`）**默认不打包**，已在
  > `zh_CN-Adobefonts_external.sty` 中将仿宋与 CJK mono 兜底指向楷体。
  > 若你系统/项目里能找到真正的仿宋字体，可恢复原设置。

如系统已安装 Adobe 四套中文字体，可改用 `zh_CN-Adobefonts_internal`：

```latex
\usepackage{zh_CN-Adobefonts_internal} % 替代 _external
```

### 4. 辅助工具

- `make` —— 入口构建（仓库自带 `Makefile`）
- `pdfinfo` / `pdftotext` —— 编译结果自检（poppler-utils）
- `git` —— 版本管理

---

## 编译指南

### 单文件编译

```bash
xelatex -interaction=nonstopmode resume-zh_CN.tex
xelatex -interaction=nonstopmode resume-en.tex
```

> 中文简历对交叉引用需求不高，单次编译即可；如出现引用问题，
> 再 `xelatex` 第二遍。

### Makefile 目标

```bash
make          # 等价 make all：clean + 编译所有 .tex
make pdf      # 仅编译，不清理
make clean    # 清理所有中间产物
make zh_CN    # 仅编译中文版
make en       # 仅编译英文版
```

### 编译后自检

```bash
pdfinfo resume-zh_CN.pdf | grep Pages   # 必须 Pages: 1
pdftotext resume-zh_CN.pdf - | head -20 # 抽查中文是否乱码
```

### 排版硬约束

- **单页 A4**（210 × 297 mm），左右 0.7 in、上下约 0.4 in
- 字体 11pt（`\LoadClass[11pt]{article}`）
- 严禁出现 `Missing character`、`Overfull > 20pt`

---

## 项目结构

```
.
├── README.md                          ← 本文件
├── CHANGELOG.md                       ← 结构化修改日志
├── AGENTS.md                          ← 智能体协作规范
├── LICENSE                            ← MIT
├── Makefile                           ← 构建入口
│
├── resume.cls                         ← 简历类文件
├── fontawesome.sty                    ← FontAwesome 图标宏
├── linespacing_fix.sty                ← 行距修复
├── zh_CN-Adobefonts_external.sty      ← 中文字体（外置版，默认）
├── zh_CN-Adobefonts_internal.sty      ← 中文字体（系统版）
│
├── resume-zh_CN.tex                   ← 中文简历源码（主入口）
├── resume-en.tex                      ← 英文简历源码
├── resume-zh_CN.pdf                   ← 中文 PDF（可入库）
├── resume-en.pdf                      ← 英文 PDF（可入库）
├── resume.preview.png                 ← README 预览图
│
├── fonts/
│   ├── Main/                          ← 拉丁字体
│   └── zh_CN-Adobe/                   ← 简中字体
└── docs/
    └── EDIT_LOG.md                    ← 智能体/人工修改报告归档
```

---

## 修改规范（智能体 + 人工）

> 详细规则见 [`AGENTS.md`](./AGENTS.md)。摘要：

| 工作流 | 触发 | 谁负责 | 必须产物 |
|---|---|---|---|
| **自动模式** | owner 对 AI 下达改简历指令 | AI 直接编辑 `.tex` | 改后立刻 `xelatex`；追加 `CHANGELOG.md` 的 `[Unreleased]` 段；在 `docs/EDIT_LOG.md` 追加报告 |
| **手动模式** | owner 自己改 `.tex`，再让 AI 整理 | AI **不**改 `.tex`，只基于 `git log/diff` 生成报告 | 在 `docs/EDIT_LOG.md` 追加 `trigger: manual` 报告 |
| **混合模式** | owner + AI 协作 | 双方共担 | 报告中标 `trigger: hybrid` |

每条 `docs/EDIT_LOG.md` 报告用 YAML front matter 记录 id/date/trigger/
commits/scope/summary，正文含背景/改动/验证/后续建议。

---

## Changelog 摘要

> 完整日志见 [`CHANGELOG.md`](./CHANGELOG.md)。

- **[Unreleased]** — 重建文档体系：新增 `AGENTS.md` 与 `CHANGELOG.md`，
  重写 `README.md`，统一规范自动/手动修改记录模式。
- **2025.11.1** — 初次入库中英双版本简历源码 + 配套模板/字体。
- **2025.11.0** — 从 [hijiangtao/resume](https://github.com/hijiangtao/resume)
  fork 初始模板。

---

## 致谢与上游

本仓库基于以下开源项目，特此致谢：

- [billryan/resume](https://github.com/billryan/resume) — 原始 LaTeX 简历模板
- [hijiangtao/resume](https://github.com/hijiangtao/resume) — fork 上游，
  适配中文环境
- [zachscrivena/simple-resume-cv](https://github.com/zachscrivena/simple-resume-cv)
- [paciorek's CV/Resume template](http://www.stat.berkeley.edu/~paciorek/computingTips/Latex_template_creating_CV_.html)
- [JianXu's CV](http://www.jianxu.net/en/files/JianXu_CV.pdf)
- [How to write a LaTeX class file and design your own CV (Part 1) - ShareLaTeX](https://www.sharelatex.com/blog/2011/03/27/how-to-write-a-latex-class-file-and-design-your-own-cv.html)

如上游更新（如 `resume.cls` 升级），可用 `git fetch upstream` + 手工合并
`resume.cls` 等核心文件，注意先在测试分支验证。

---

## License

[The MIT License (MIT)](http://opensource.org/licenses/MIT) — 与上游一致。
**Copyrighted fonts are not subjected to this License.**
