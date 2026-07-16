# 修改报告归档（Edit Log）

> 本文件归档每次对本仓库有意义的改动报告，无论触发方是 owner 本人（manual）
> 还是 AI 智能体（agent）或两者协作（hybrid）。每条报告按
> [`AGENTS.md`](../AGENTS.md) 第 5 节定义的模板填写。

## 索引

| ID | 日期 | 触发方 | 摘要 |
|---|---|---|---|
| [2026-07-16-01](#2026-07-16-01) | 2026-07-16 | agent | 简历新增 FoxSay 狐说项目，并紧凑化为单页 PDF |

---

<a id="2026-07-16-01"></a>

## 2026-07-16-01

```yaml
id: 2026-07-16-01
date: 2026-07-16
trigger: agent
commits:
  - 072b633   # feat: add FoxSay project to zh_CN resume + commit rendered PDFs
scope:
  - resume-zh_CN.tex
  - zh_CN-Adobefonts_external.sty
  - resume-zh_CN.pdf
  - resume-en.pdf
summary: "在中文简历项目经历首位新增 FoxSay 狐说项目，并将整页压缩为 1 页 A4"
```

### 背景
- owner 在校招/实习投递场景下需要一份突出"AI Agent 全栈开发"能力的简历。
- 既有项目以 PCB / RAG 业务为主，缺少能体现 **多 Agent + LangGraph + 完整
  学习闭环** 的旗舰项目。
- 简历必须保持单页 A4（硬约束），新内容需要腾空间。

### 改动清单
- 在 `resume-zh_CN.tex` 的「项目经历」首位新增 `FoxSay 狐说 | 课程级AI学习Copilot`。
- FoxSay 项下保留 4 条核心 bullet（CRAG 边界控制 / 全栈技术 / 完整学习闭环 /
  狐狸人设贯穿），每条只写关键量化与机制，不写长句。
- 修复合并前已存在的字体隐患：`zh_CN-Adobefonts_external.sty` 中
  `AdobeFangsongStd-Regular.otf` 缺失，将 `\setCJKmonofont` 和 `\setCJKfamilyfont{zhfs}`
  兜底指向 `AdobeKaitiStd-Regular.otf`。
- 整体压缩策略：
  - 顶部/底部页边距由 `0.50in / 0.5in` 收紧至 `0.40in / 0.40in`；
  - itemize 列表 `topsep=0.10em, parsep=0.1ex`；
  - `\linespread{0.90}` 全局行距压缩；
  - 「竞赛获奖」改为 `multicols{2}` 双列布局；
  - 其他 section 同步缩短冗词。
- 同步在「校园实践」「PCBTool.AI」「创享商圈」bullet 上做了去冗优化。

### 验证
- 编译命令：`xelatex -interaction=nonstopmode resume-zh_CN.tex`
- 退出码：`0`
- 页数：`Pages: 1`
- 警告：编译期 Overfull 0（最初 2 处已通过措辞调整消化）。
- 渲染产物：`resume-zh_CN.pdf` 153 KB；`resume-en.pdf` 32 KB。

### 后续建议（非必须）
- 后续如再增项目，可考虑把 "FoxSay 完整学习闭环" 段进一步精简为 1 行。
- `linespread=0.90` 已接近可读性下限，不建议继续下调；新增内容应优先
  通过删冗词腾空间。
- 可在 `Makefile` 中追加 `all: pdf` 默认目标，封装中英两份一次性编译。
