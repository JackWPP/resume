# AGENTS.md — 智能体协作规范

> 本文件面向任何对本仓库进行改动的 AI 智能体（GitHub Copilot、Claude、Cursor、
> Cline、Aider、Codex 等）以及仓库 owner。规则适用于**自动模式**与**手动模式**
> 两种工作流，请所有参与者（含人类与 AI）共同遵守。

---

## 1. 仓库背景

- **所有者**：王海翔（GitHub: [@JackWPP](https://github.com/JackWPP)）
- **用途**：个人简历的 LaTeX 源码与渲染产物仓库
- **上游**：fork 自 [hijiangtao/resume](https://github.com/hijiangtao/resume)
  （其本身 fork 自 [billryan/resume](https://github.com/billryan/resume)）
- **许可证**：MIT（与上游一致）

> ⚠️ 智能体在自我介绍时不得声称"我是这个仓库的作者"。所有内容编辑决策权
> 归 owner，AI 仅作为辅助。

---

## 2. 仓库目录与文件约定

```
resume/
├── README.md                    # 仓库说明（编译指南、依赖、Changelog 索引）
├── CHANGELOG.md                 # 结构化修改日志（每次合入必更新）
├── AGENTS.md                    # 本文件：智能体协作规范
├── LICENSE                      # MIT
├── Makefile                     # 编译入口
├── resume.cls                   # 简历类文件（不要轻易改）
├── fontawesome.sty              # FontAwesome 图标宏
├── linespacing_fix.sty          # 行距修复
├── zh_CN-Adobefonts_external.sty  # 中文字体（外置版，本仓库默认）
├── zh_CN-Adobefonts_internal.sty  # 中文字体（系统字体版）
├── resume-zh_CN.tex             # 中文简历源码（主入口）
├── resume-en.tex                # 英文简历源码
├── resume-zh_CN.pdf             # 中文简历渲染产物（可入库）
├── resume-en.pdf                # 英文简历渲染产物（可入库）
├── resume.preview.png           # README 预览图
├── fonts/
│   ├── Main/                    # 拉丁字体（TeX Gyre Termes / Fontin）
│   └── zh_CN-Adobe/             # 简中字体（宋/楷/黑）
└── docs/
    └── EDIT_LOG.md              # 智能体介入的修改报告归档
```

> 临时文件（`.aux`、`.log`、`.synctex.gz`、`.xdv`、`.out`、`.bak0`）已在
> `.gitignore` 中忽略，请勿手动 `git add -f`。

---

## 3. 两种工作流模式

### 3.1 自动模式（AI 主动改简历）

适用场景：owner 在 IDE 中对智能体下达明确指令，例如
"帮我把 FoxSay 项目精简"、"加一个 XX 项目"、"把这个奖项挪到第一行"。

**流程：**

1. **改动前**：智能体应先简要说明计划改什么、影响哪几个 section。
2. **改动中**：直接编辑 `.tex` 文件；如需保证单页排版，应在改动后立刻
   `make`（或 `xelatex`）编译一次，确认无 error 且仍为 1 页。
3. **改动后（强制）**：必须更新 `CHANGELOG.md` 的 `[Unreleased]` 段，并在
   `docs/EDIT_LOG.md` 追加一条结构化报告。详见第 4、5 节。
4. **产物更新**：重新编译后，`resume-*.pdf` 必须一并提交。

### 3.2 手动模式（owner 自己改简历）

适用场景：owner 直接在 `.tex` 文件里改内容，未借助智能体；之后某次会话
中向智能体提出"帮我整理一下最近的修改"。

**智能体的职责：**

1. **不得自行修改 `.tex`**。仅基于 git 历史生成报告。
2. **报告生成步骤**：
   - `git log --oneline -n` 查看最近若干 commit；
   - `git diff <range>` 获取实际改动内容；
   - 在 `docs/EDIT_LOG.md` 追加一条报告，标 `trigger: manual`；
   - 如 owner 明确要求"更新到 CHANGELOG"，再将摘要同步进 `CHANGELOG.md`。
3. **不得覆盖或删除**已存在的 `EDIT_LOG` 历史条目，只能 append。

### 3.3 混合模式（hybrid）

owner 与 AI 协作改一段内容（如先口述思路、再让 AI 润色措辞），则
`trigger: hybrid`，并在条目中说明各自贡献。

---

## 4. CHANGELOG.md 写入规范

智能体在自动模式下**必须**在 `CHANGELOG.md` 顶部 `[Unreleased]` 段追加条目。
每条至少包含：

```markdown
- <一句话摘要>。 (<type>, <trigger>)
```

- 写入时使用**未提交版本**的日期（`date +%Y-%m-%d`）；
- 同一会话多次改动可合并为一条，用分号分隔；
- 重大调整（新增 section、改 class）应单独成段并加子标题；
- owner 明确"打 tag"或"发版"时，把 `[Unreleased]` 的内容剪切到带日期的版本段。

---

## 5. docs/EDIT_LOG.md 报告模板

每条报告使用以下模板（YAML front matter + Markdown 正文）：

```markdown
---
id: 2026-07-16-01
date: 2026-07-16
trigger: agent          # agent | manual | hybrid
commits:
  - <commit-hash-or-range>
scope:
  - resume-zh_CN.tex
  - CHANGELOG.md
summary: "<一句话标题>"
---

## 背景
<为什么改、改之前的状态>

## 改动清单
- <要点 1>
- <要点 2>

## 验证
- 编译命令: `xelatex resume-zh_CN.tex`
- 页数: 1
- 警告: 无 / Overfull X 处 / ...

## 后续建议（非必须）
- <下次可以优化的点>
```

`id` 采用 `<date>-<NN>` 顺序编号（每天从 01 开始）。

---

## 6. 编译与质量门槛

任何提交前，智能体应确保：

- [ ] `xelatex resume-zh_CN.tex` 编译通过（`exit code = 0`）；
- [ ] 中英两个 PDF 至少其中一个被更新且入库；
- [ ] `pdfinfo *.pdf | grep Pages` 输出 `Pages: 1`（单页硬约束）；
- [ ] 无 `Missing character` / 字体错误；
- [ ] Overfull 警告 ≤ 2 且 < 20pt；如有应尝试在 `\texttt{}` 间断点处
       加 `\allowbreak` 或调整 wording。

编译命令汇总：

```bash
# 单独编译
xelatex resume-zh_CN.tex
xelatex resume-en.tex

# 一键编译全部（依赖 Makefile）
make all

# 清理
make clean
```

---

## 7. 单页简历的工程约束

由于本仓库的核心交付物是**单页 A4 PDF**，智能体在添加新项目/章节时必须
主动评估空间，必要时：

- 缩短既有 bullet 的措辞（去冗词）；
- 调整 `topsep` / `parsep` 等列表参数（局部覆盖，不动 `resume.cls`）；
- 使用 `\linespread{0.88..0.92}` 局部压缩行距；
- 谨慎使用 `multicol`（中文+长字符串易溢出）。

**禁止**：通过删减 owner 已表达的内容来腾空间；遇到无法两全时，停下
来询问 owner 偏好。

---

## 8. 提交（commit）规范

提交信息建议格式：

```
<type>(<scope>): <subject>

<body>
```

- `type`: `feat` / `fix` / `docs` / `chore` / `refactor` / `style`
- `scope`: `zh` / `en` / `cls` / `docs` / `ci`
- 例子：`feat(zh): add FoxSay project to project section`

智能体在自动模式下**应**按此格式生成 commit message，并在 `body` 中
引用对应 `EDIT_LOG` 的 `id`。

---

## 9. 智能体不得做的事

- ❌ 自行删除 owner 已写好的内容，除非明确要求；
- ❌ 未经 owner 同意直接 `git push`；
- ❌ 把临时文件（`.aux`/`.log`/...）强制 `git add -f`；
- ❌ 修改 `LICENSE` 文件；
- ❌ 在 `README.md` 中虚构 owner 的个人经历、获奖、项目；
- ❌ 把"AI 自动生成"以外的内容吹嘘或浮夸（保持简历真实可信）。

---

## 10. 与 owner 的协作协议

- 智能体的所有改动应在最终落地前用一句话总结改了什么；
- 如遇 owner 的指令含糊（例如"再好看点"），先反问 1–2 个澄清问题
  （颜色？字号？留白？），不要直接动手；
- 完成改动后主动询问是否要 `git commit` / `git push`，**不要默认 push**。
