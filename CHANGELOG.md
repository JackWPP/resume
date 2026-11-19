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

### Added
- 新增 `xuchencen/` 目录：为徐晨岑制作中文 LaTeX 简历，含 1 个通用版 +
  3 个字节跳动岗位定向版（抖音电商行业运营 / 商业化渠道销售 / 生活服务
  活动运营），各版均 1 页 A4，复用根目录 `resume.cls` 与字体（通过 `fonts`
  软链接 + `TEXINPUTS` 解析）。 (`feat`, `agent`)
- 徐晨岑：依据 `xuchencen/投递列表.xlsx` 的 5 个字节校招岗位（品类营销传
  播/红果厂牌运营/红果粉丝运营/高热研判编辑/文创营销运营经理）各制作一份
  JD 定向版简历（.tex + .pdf，均单页零警告），打包为
  `xuchencen/投递包-2026秋招/` 与 `投递包-2026秋招.zip`。 (`feat`, `agent`)
- 徐晨岑：按 `xuchencen/投递方向.xlsx`（番茄小说社区运营 / 抖音UGC用户运
  营实习生 / 商业化渠道销售 / 红果粉丝运营 / 生活服务品牌创意传播）重做
  5 份 JD 定向版简历，融入作品集素材（小红书/抖音双平台账号「無语SAMA」），
  抖音UGC版含 8 年 cos 与动漫社宅舞经历；重新打包投递包。 (`feat`, `agent`)
- 徐晨岑：删除旧投递列表（`投递列表.xlsx`）对应的 7 份岗位版本简历
  （高热研判编辑/文创营销运营经理/厂牌运营/品类营销传播/生活服务活动
  运营/抖音优质生态运营/抖音电商行业运营）与旧 Excel，保留新方向 5 份 +
  通用版兜底。 (`chore`, `agent`)
- 徐晨岑：新增 `xuchencen/百度投递-2026/`——百度 2027 届校招两个岗位的
  JD 定向版（内容策划 J100791 / 销售管理运营分析 J101196）+ 整合校电视
  台新闻稿、双平台自媒体爆款数据（小红书 99.9 万曝光、抖音 2535.9 万播
  放）、双语与 AI 提效素材的内容策划向通用版；全部弱化留学经历（仅教育
  背景一提）；打包 zip。 (`feat`, `agent`)
- 徐晨岑：百度投递新增产品运营定向版（J100766，对齐市场调研/活动策划/
  渠道追踪/商务落地/数据复盘/AI提效，突出动漫社宅舞 14 场呼应 JD"社团
  活动类经验优先"）；销售管理运营分析版同步补入校园内容实践（电视台+
  自媒体爆款），删除弱相关的 PCBTool 项目块保单页。 (`feat`, `agent`)
- 徐晨岑：百度投递新增内容生态运营定向版（J101050，对齐内容品类/消费趋
  势分析、运营方法沉淀、数据复盘，海外平台认知与动漫社社区经验呼应 JD
  优先项）。 (`feat`, `agent`)
- 徐晨岑：内容生态运营版（J101050）按 owner 提供的新简介再优化——垂类
  内容选题/全周期复盘、互动留存数据分析、爆款共性沉淀、AI 内容趋势汇总
  等 JD 关键词全量对齐。 (`feat`, `hybrid`)
- 徐晨岑：新增 `xuchencen/百度投递方向.xlsx`（投递方向一览/方向统计/岗位
  详情三个 sheet），收录百度 4 个校招岗位（J100791/J101196/J100766/
  J101050）及对应简历文件。 (`chore`, `agent`)
- 徐晨岑：百度投递新增新媒体运营定向版（J100705，官方社媒账号运营/内容
  方案策划/数据复盘/AIGC 提效），并同步加入 `百度投递方向.xlsx`（一览/
  统计/详情三表）。 (`feat`, `agent`)
- 徐晨岑：百度 6 份简历（5 定向 + 通用版）教育背景核心课程统一加入
  「市场营销（成绩优异）」（替换原"市场分析"表述），回应校招 JD 中
  市场营销专业优先的要求。 (`feat`, `agent`)
- 徐晨岑：百度 6 份简历核心课程统一更新为公司金融/计量经济学/财务管理学/
  管理会计/市场营销学（成绩优异）/微观经济学；产品运营版（J100766）动漫
  社宅舞改为校舞蹈社团并扩充活动统筹内容。 (`feat`, `agent`)
- 徐晨岑：新增 `xuchencen/快手投递-2026/`——快手【留用实习】平台产品经
  理-企业效能（岗位ID 11462）定向版简历，突出财务管理专业（命中 JD"财管
  优先"）、数据导向、AI 智能体设计与结构化文档能力；打包 zip。 (`feat`,
  `agent`)
- 徐晨岑：快手投递新增内容运营-二次元内容岗（岗位ID 13283）定向版，主打
  8年cos（20+组）、B站二创、动漫社宅舞14场等二次元经历，对齐内容增长/
  热点覆盖/信息检索/文案撰写等 JD 关键词。 (`feat`, `agent`)
- 徐晨岑：新增 `xuchencen/腾讯投递-2026/`——腾讯 CDG 市场营销岗定向版
  简历（基于 owner 提供的营销向素材，对齐 AI 营销/数据决策/品牌全案/
  英语加分项），打包 zip。 (`feat`, `hybrid`)
- 徐晨岑：腾讯 CDG 市场营销岗简历改版 V2（综合此前版本素材）——动漫社改
  为校舞蹈社团展演（14 场/300-1000 人），全文去"品牌"化（0 处），校园
  营销内容实践按 owner 意见重写。 (`feat`, `hybrid`)
- 徐晨岑：腾讯 CDG 市场营销岗简历校园营销内容实践替换为 owner 提供版本
  （自媒体 2 条：全流程执行+数据复盘/AI 提效；电视台内容撰稿；舞蹈社团
  线下活动策划），技能栏术语同步统一。 (`feat`, `hybrid`)
- 徐晨岑：腾讯投递新增行业运营岗（postid 1153452731391100931）定向版，
  对齐行业市场分析、经营指标体系建设、方案撰写与 Excel 建模、风险预警
  等 JD 关键词；与市场营销-腾讯版同文件夹打包。 (`feat`, `agent`)

### Changed
- 王海翔中文简历全面优化：个人总结改为「多 Agent + 受控 RSI + AI4S」主线；
  新增「科研成果」段（arXiv:2610.03577）与「智训引擎 RSI Harness」项目
  （受控 RSI 架构 + 门控阈值 + Agent 工具边界，macro-F1 0.277→0.787）；
  PCBTool 补 NVIDIA Developer Community 收录；教育背景硕士置前并统一为
  「化工学院」；技能栈补充 RSI/Docker/OpenCV/Flutter 等；删除「校园实践」，
  竞赛获奖改为逐条列表；启用 hyperref 可点击链接；行距 0.85→0.90，维持
  单页 A4。 (`feat`, `agent`)
- 英文版扩充：新增 Summary 段、FoxSay 项目（此前缺失），毕设条目同步为
  模型优化四条结构；整体压缩排版（边距 0.6in/0.4in、标题间距、行距 0.88）
  维持单页。 (`feat`, `hybrid`)
- 新增「毕业设计 | 电解水气泡识别检测模型开发」并置顶于项目经历，替换
  创享商圈 ROBOT-XZC；模型优化拆分展开为检测模型/分割扩展两条；项目经历
  提前至校园实践之上；竞赛获奖改单段内联排版；FoxSay 措辞压缩；英文版
  同步；移除已过期的“预计2026年6月毕业”。 (`feat`, `hybrid`)
- 重建仓库文档体系：新增 `AGENTS.md` 与本 `CHANGELOG.md`，重写 `README.md`
  ，统一规范自动/手动两种修改记录模式。 (`docs`, `hybrid`)

### Removed
- 王海翔中文简历删除「FoxSay 狐说」项目块（owner 确认与当前方向关联度下降）。 (`chore`, `agent`)

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
