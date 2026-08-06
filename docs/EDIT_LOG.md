# 修改报告归档（Edit Log）

> 本文件归档每次对本仓库有意义的改动报告，无论触发方是 owner 本人（manual）
> 还是 AI 智能体（agent）或两者协作（hybrid）。每条报告按
> [`AGENTS.md`](../AGENTS.md) 第 5 节定义的模板填写。

## 索引

| ID | 日期 | 触发方 | 摘要 |
|---|---|---|---|
| [2026-08-05-04](#2026-08-05-04) | 2026-08-05 | hybrid | 英文版扩充：Summary + FoxSay + 毕设四条结构，压缩排版保单页 |
| [2026-08-05-03](#2026-08-05-03) | 2026-08-05 | agent | 新增 make export：带日期命名的交付副本导出 |
| [2026-08-05-02](#2026-08-05-02) | 2026-08-05 | hybrid | 毕业设计入简历并置顶，替换创享商圈，压缩 FoxSay，单页复验 |
| [2026-08-05-01](#2026-08-05-01) | 2026-08-05 | agent | 配置本机 LaTeX 编译环境（BasicTeX + 宏包），修复 Makefile en 目标 |
| [2026-07-16-01](#2026-07-16-01) | 2026-07-16 | agent | 简历新增 FoxSay 狐说项目，并紧凑化为单页 PDF |

---

<a id="2026-08-05-04"></a>

## 2026-08-05-04

```yaml
id: 2026-08-05-04
date: 2026-08-05
trigger: hybrid
commits:
  - (待 owner 确认后提交)
scope:
  - resume-en.tex
  - resume-en.pdf
  - CHANGELOG.md
  - docs/EDIT_LOG.md
summary: "英文版扩充：新增 Summary 与 FoxSay，毕设同步模型优化四条结构"
```

### 背景
- owner 反馈英文版较空，希望扩充精进。英文版此前缺 Summary 段与 FoxSay
  旗舰项目，毕设条目也只有 3 条（未展开模型优化）。

### 改动清单
- 新增 `Summary` 段（译自中文「个人总结」，去掉与 Education 重复的保研句）。
- 新增 `FoxSay -- Course-Level AI Learning Copilot`（4 bullet：CRAG 门控 /
  全栈 / 学习闭环 / 人设），其中人设并入全栈 bullet 控制篇幅。
- 毕设条目同步为 4 条：Dataset engineering / Detection model（展开
  P3LCRefine 与 NWD 机制）/ Segmentation extension / Platform integration。
- 排版压缩（局部覆盖，不动 `resume.cls`）：左右边距 0.6in、上下 0.4in、
  标题间距收紧、`\linespread{0.88}`、列表 parsep 收紧；Education 的 Awards
  行删除（与 Honors & Awards 完全重复）。
- 修复三处 Overfull 根因：LaTeX 不在斜杠处断行（`detail/background`、
  `visual/copy/interaction`、`Mosaic/HSV/MixUp`）改逗号/分词。

### 验证
- 编译命令：`xelatex resume-en.tex`，exit 0。
- 页数：`Pages: 1`；`Missing character` 0。
- Overfull：2 处（5.58pt / 5.86pt），均 < 20pt 且 ≤ 2 处，符合质量门槛。
- bbox：首页底部 yMax=806.5pt < 813.2pt 页边区。
- 章节顺序：Summary → Education → Skills → Project (Thesis/FoxSay/PCBTool)
  → Campus → Honors。

### 后续建议（非必须）
- 底部余量仅 6.7pt，后续再改英文版需谨慎，优先删冗词而非加内容。

---

<a id="2026-08-05-03"></a>

## 2026-08-05-03

```yaml
id: 2026-08-05-03
date: 2026-08-05
trigger: agent
commits:
  - (待 owner 确认后提交)
scope:
  - Makefile
  - .gitignore
  - README.md
  - CHANGELOG.md
  - docs/EDIT_LOG.md
summary: "新增 make export：带日期命名的交付副本导出"
```

### 背景
- owner 要求所有导出产物统一命名：中文 `王海翔-简历-YYYYMMDD`，英文
  `JackWang-Resume-YYYYMMDD`，便于投递时区分版本。

### 改动清单
- `Makefile` 新增 `export` 目标：依赖 `pdf` 确保先编译，将两份 PDF 复制为
  `export/王海翔-简历-$(date +%Y%m%d).pdf` 与
  `export/JackWang-Resume-$(date +%Y%m%d).pdf`。
- `.gitignore` 新增 `/export/`（交付副本可再生，不入库）。
- `README.md` 的 Makefile 目标表补充 `make export` 与命名规则说明。
- 仓库规范产物（`resume-zh_CN.pdf` / `resume-en.pdf`）命名保持不变，
  仍作为入库的渲染产物。

### 验证
- 命令：`make export`，exit 0。
- 产物：`export/王海翔-简历-20260805.pdf`（155 KB）、
  `export/JackWang-Resume-20260805.pdf`（33 KB）。
- `git check-ignore` 确认 export 目录被忽略；导出中文版 `Pages: 1`。

### 后续建议（非必须）
- 如需同时导出当天所有历史版本（保留旧日期副本），可改为按日期追加目录，
  当前实现会覆盖同一天旧副本。

---

<a id="2026-08-05-02"></a>

## 2026-08-05-02

```yaml
id: 2026-08-05-02
date: 2026-08-05
trigger: hybrid
commits:
  - (待 owner 确认后提交)
scope:
  - resume-zh_CN.tex
  - resume-en.tex
  - resume-zh_CN.pdf
  - resume-en.pdf
  - Makefile
  - CHANGELOG.md
  - docs/EDIT_LOG.md
summary: "毕业设计入简历并置顶，替换创享商圈，压缩 FoxSay，维持单页"
```

### 背景
- owner 将本科毕业论文（电解水场景下的气泡识别检测模型开发）PDF 放入仓库，
  希望将其写入简历并替代部分项目。
- 毕设与硕士研究方向（基于计算机视觉的电解水电极表面气泡追踪与量化分析）
  完全同频，是简历上唯一的计算机视觉科研项目。

### 改动清单
- owner 决策（经确认）：替换「创享商圈 ROBOT-XZC」，保留全部技术项目；
  后续又指示将毕设提到项目经历首位并压缩 FoxSay。
- 中文版新增毕设条目（3 条量化 bullet：数据集工程 / 模型优化 / 平台闭环），
  数据均取自论文摘要与结论（9524 标注框、99.79% 掩码覆盖率、+0.013% 参数
  下 mAP@50 +3.42% 与 mAP@50:95 +4.94%、Mask mAP@50=0.839、KD-Tree/
  瑞利拟合端到端诊断）。
- FoxSay 压缩：删去 `reactflow`/`@dagrejs/dagre`/`katex` 库名罗列与四个
  CSS 动画名清单；CRAG 门控改为紧凑括注式。
- 排版腾空间（局部覆盖，不动 `resume.cls`）：\titlespacing 收紧
  section/subsection 标题间距；竞赛获奖 multicols 的 `\multicolsep` 12pt→6pt；
  移除已过期的“预计2026年6月毕业”。
- 英文版同步：新增 Graduation Thesis 条目并置顶，删除 ROBOT-XZC，去除误
  插的重复毕设块。
- 模型优化着重（owner 指示）：毕设条目由 3 条拆为 4 条——「数据集工程 /
  检测模型 / 分割扩展 / 平台闭环」，展开 P3LCRefine 内部机制（高通滤波+
  深度可分离卷积+可学习残差）、NWD 损失的高斯建模动机、增强配方与四项
  量化指标（S/mAP@50/mAP@50:95/参数开销）。
- 章节重排（owner 指示）：项目经历提前至校园实践之上，校园实践降级。
- 单页修复：竞赛获奖由 multicols 双列改为单段内联——multicols 环境在页底
  剩余 44.7pt（实测块高约 24-36pt）时仍拒绝放置，内联后稳定单页；同步微
  调 FoxSay/校园实践措辞与 multicols 相关间距参数（已随 multicols 移除）。
- 修复 `Makefile` 的 `clean` 误删所有 PDF 的问题（原 `$(RM) *.pdf` 会连带
  删除仓库根目录的毕业论文 PDF）：`clean` 改为仅清理编译中间产物，`all`/
  `pdf`/`en`/`zh_CN` 目标不再依赖 clean。

### 验证
- 编译命令：`xelatex resume-zh_CN.tex`（两遍）与 `xelatex resume-en.tex`。
- 页数：中英均 `Pages: 1`；`Missing character` 0、Overfull 0。
- bbox 实测：首页底部文本 yMax=805.9pt < 页边区 813.2pt，无越界。
- `pdftotext` 抽查：项目顺序为 毕业设计 → FoxSay → PCBTool，竞赛获奖四
  项全部落于首页；无创享/ROBOT 残留。
- `make clean && make all` 复验：clean 后两份 PDF 保留，重建正常。

### 后续建议（非必须）
- 英文版尚未收录 FoxSay；如需投递海外岗位可考虑补齐，注意单页空间。
- 后续再增内容时优先走“删冗词 + 局部列表参数”，标题间距已接近视觉下限。

---

<a id="2026-08-05-01"></a>

## 2026-08-05-01

```yaml
id: 2026-08-05-01
date: 2026-08-05
trigger: agent
commits:
  - (待 owner 确认后提交)
scope:
  - Makefile
  - README.md
  - CHANGELOG.md
  - docs/EDIT_LOG.md
  - resume-zh_CN.pdf
  - resume-en.pdf
summary: "配置本机 macOS LaTeX 编译环境，修复 Makefile en 目标，双版 PDF 重新编译"
```

### 背景
- owner 希望本机（macOS arm64 / Apple M1）能直接编译、持续更新简历，但
  当时未安装任何 TeX 发行版（`which xelatex` 为空）。
- 仓库字体全部内置于 `fonts/`（外置版 `zh_CN-Adobefonts_external`），
  因此无需安装系统级中文字体，只需 XeLaTeX 工具链。

### 改动清单
- 安装 [BasicTeX 2026](https://tug.org/mactex/morepackages.html)（brew cask，
  约 140MB，远小于完整 MacTeX），`/Library/TeX/texbin` 已自动写入
  `/etc/paths.d/TeX`，新开终端即生效。
- 将 `/usr/local/texlive` 所有权 `chown` 给当前用户，之后 `tlmgr` 免 sudo。
- `tlmgr update --self` 后安装宏包：`xecjk` `xltxtra` `xifthen` `fontspec`
  `xcolor` `geometry` `titlesec` `enumitem` `nth` `cite` `tools`
  `etoolbox` `realscripts` `ifmtarg`（后两个为编译时缺失补装）。
- 安装 poppler（提供 `pdfinfo`，供单页自检）。
- 修复 `Makefile` 的 `en` 目标：原指向不存在的 `resume.tex`，改为
  `xelatex resume-en.tex`；`make all` 与 `make zh_CN` 原本即可用。
- `README.md` 补充 macOS 快速配置（BasicTeX 路线）与完整 tlmgr 安装清单；
  CHANGELOG `[Unreleased]` 追加 `Chore` 条目。
- 中英双版 PDF 用本机工具链重新编译入库（内容无改动）。

### 验证
- 编译命令：`xelatex -interaction=nonstopmode resume-zh_CN.tex`（两遍）
  与 `make all`、`make en`、`make zh_CN` 均通过。
- 退出码：`0`；页数：中英均为 `Pages: 1`。
- `Missing character` 计数：0；Overfull 警告：0。
- `pdftotext resume-zh_CN.pdf` 抽查：姓名/联系方式/正文中文渲染正常。

### 后续建议（非必须）
- 新增宏包时直接 `tlmgr install <包名>`（已免 sudo），无需再动系统。
- 如某天需要完整 MacTeX（GUI 应用、全部宏包），`brew install --cask mactex`
  可随时升级，不影响仓库文件。

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
