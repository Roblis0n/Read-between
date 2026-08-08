# Read Between — 恋爱全流程参谋

> 追不追 → 怎么追 → 追到之后怎么办

[English](README.en.md) · 中文

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Version](https://img.shields.io/badge/version-v3.0-blue.svg)](CHANGELOG-v1.md)

一个覆盖恋爱全生命周期的 Claude Code / Codex Skill。帮助用户在亲密关系中同时做到：**感受被接住、事实被看清、下一步能执行**。

不做读心术、不做成功率预测、不做操控教学。

## 能力清单

| 能力 | 说明 |
|------|------|
| 🧭 追/不追决策 | 结构化五步框架：信号盘点→自我澄清→代价评估→可逆性设计→决策 |
| 🗺️ 追求策略 | 四阶段全链路：建立存在感→建立连接→邀约→推进与表白 |
| 🔍 聊天证据分析 | 八维分析：原话/行为/背景/语用/替代解释/信息缺口/可验证信号/风险 |
| ✍️ 消息代拟 | 邀约/表白/道歉/日常/设置边界——默认给一条可直接发送的版本 |
| 🎭 对话演练 | 假设分支推演，含复盘反馈（不克隆真实人格） |
| 🫂 情绪承接 | 复述→分离→允许矛盾→稳定动作→判断退出时机 |
| 🔧 冲突与修复 | 降级→责任区分→道歉四要素→修复行动 |
| 📚 关系教育 | 依恋、边界、同意、信任、沟通、嫉妒等现代关系知识体系 |
| 🏠 长期伴侣与婚姻 | 同居、婚姻、分工、共同决策——概要级支持 |
| 🔮 星座/八字/MBTI | 可应要求提供参照视角——符号框架，不预测、不判决、不替代行为观察 |
| 📜 古典参照 | 内置古典语料库——《诗经》《世说新语》《菜根谭》等10部经典原文，agent自主检索释义，五声音格自适应，拓展性思考+联网现代参照 |
| 🛡️ 安全分流 | 暴力/胁迫/自伤/跟踪/私密影像威胁/未成年人/权力差——覆盖普通恋爱策略 |
| 🪞 真实意图识别 | 当用户表层请求与深层需求存在差距时，温和反映而非戳穿——用户有权否认。唯一例外：以在乎为名的控制行为必须被明确命名 |

### 明确不做的

- 不报恋爱成功率百分比
- 不诊断人格（NPD/依恋类型/人格障碍）
- 不教 PUA/推拉/制造嫉妒/冷暴力/人格克隆
- 不自动保存聊天记录
- 不替用户做最终决定
- 不戳穿用户的自我保护叙事——反映差距，不贴标签

## 快速开始

将此目录放入你的 skills 目录。skill 通过关键词自动触发——当用户在对话中提及恋爱/约会/追求/聊天分析/消息代拟等话题时激活。

运行静态验证确认文件完整：

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/validate_contract.ps1
```

## 目录结构

```
read-between/
├── SKILL.md                    # 核心路由、不可协商规则、工作流
├── ARCHITECTURE.md             # 架构设计文档（运行逻辑、设计原则、差异分析）
├── CHANGELOG-v1.md             # v1 迭代变更日志
├── README.md
├── LICENSE                     # MIT
├── .gitignore
├── agents/
│   └── openai.yaml             # 界面元数据
├── references/                 # 26 个按需加载的深度指令（含古典层与真实意图检测）
│   ├── intent-insight.md           # 意图识别与真实意图洞察
│   ├── genuine-intent.md           # 真实意图检测执行入口（触发条件、速查表、处理流程）
│   ├── self-deception-taxonomy.md  # 10类自我欺骗模式完整分类（语言信号四层拆解、响应策略、谱系）
│   ├── pursue-or-not.md            # 追/不追五步决策框架
│   ├── pursuit-strategy.md         # 追求四阶段全链路
│   ├── early-dating.md             # 早期约会与关系建立
│   ├── chat-ingestion-contract.md  # 聊天输入协议
│   ├── chat-evidence-and-uncertainty.md  # 聊天证据分析框架
│   ├── reply-drafting.md           # 消息代拟
│   ├── dialogue-practice.md        # 对话演练
│   ├── emotional-containment.md    # 情绪承接与稳定
│   ├── relationship-education.md   # 现代关系知识体系
│   ├── conflict-and-repair.md      # 冲突与修复
│   ├── partnership-marriage-overview.md  # 长期伴侣与婚姻概要
│   ├── safety-abuse-and-crisis.md  # 安全虐待危机分流
│   ├── privacy-threat-model.md     # 隐私威胁模型
│   ├── memory-protocol.md          # 会话记忆与用户自主存档
│   ├── personality-insight-layer.md # 星座/八字/MBTI 参照视角
│   ├── classical-interpretation.md  # 古典释义规则与场景路由
│   ├── classical-voices.md         # 五种古典声音系统
│   ├── classical-catalog.md        # 古典语料库导航目录
│   ├── classical-corpus/           # 10部古典原文
│   │   ├── _README.md
│   │   ├── 诗经.md
│   │   ├── 世说新语.md
│   │   ├── 菜根谭.md
│   │   ├── 小窗幽记.md
│   │   ├── 围炉夜话.md
│   │   ├── 论语.md
│   │   ├── 庄子.md
│   │   ├── 道德经.md
│   │   ├── 孟子.md
│   │   └── 乐府诗集.md
│   ├── source-registry.md          # 知识来源注册表
│   ├── lifecycle-routing.md        # 全生命周期状态机
│   ├── output-contracts.md         # 输出契约（含多对象比较模式）
│   └── data-root.txt               # 数据目录路径
└── scripts/                    # 8 个 PowerShell 验证工具
    ├── validate_contract.ps1        # 静态契约验证（文件存在性 + 交叉引用完整性）
    ├── validate_chat_import.ps1     # 聊天导入格式验证
    ├── normalize_timestamps.ps1     # 时间戳标准化
    ├── redact_transcript.ps1        # 聊天记录去标识化
    ├── validate_record.ps1          # 记忆记录格式验证
    ├── validate_memory_store.ps1    # 记忆存储完整性验证
    ├── detect_cross_relationship_leakage.ps1  # 跨关系信息泄漏检测
    └── search_classics.ps1          # 古典原文关键词检索
```

## 验证工具

8 个 PowerShell 脚本覆盖从格式检查到隐私保护的完整链路：

| 脚本 | 用途 | 何时运行 |
|------|------|---------|
| `validate_contract.ps1` | 检查全部文件存在、交叉引用完整、无孤儿文件 | 首次安装、升级后 |
| `validate_chat_import.ps1` | 验证导入的聊天记录格式正确 | 导入聊天前 |
| `normalize_timestamps.ps1` | 将聊天时间戳统一为标准格式 | 导入聊天前 |
| `redact_transcript.ps1` | 去除聊天记录中的真实姓名和标识信息 | 分享或存档前 |
| `validate_record.ps1` | 验证记忆记录的字段完整性和格式 | 写入记忆后 |
| `validate_memory_store.ps1` | 检查记忆目录结构完整性 | 首次使用、数据目录变更后 |
| `detect_cross_relationship_leakage.ps1` | 检测不同关系档案间的人物信息泄漏 | 维护多段关系档案时 |
| `search_classics.ps1` | 跨古典原文关键词检索，返回命中位置与上下文 | 需要古典参照时 |

## 进一步阅读

- **[ARCHITECTURE.md](ARCHITECTURE.md)** — 运行逻辑流程图、设计原则、三层洞察架构、与原始设计的差异分析、竞争差异化
- **[CHANGELOG-v1.md](CHANGELOG-v1.md)** — v1 迭代的逐批次修改明细、修复前后对比、验证清单
- **[SKILL.md](SKILL.md)** — 核心路由、不可协商规则、工作流、快速路由表

## Roadmap

以下能力在 description 中未承诺，属于自然扩展方向：

- [ ] 异地恋策略独立模块
- [ ] 分手恢复与复合评估独立模块
- [ ] 更全面的性别与关系形态中性化
- [ ] 古典层作为可选扩展包（当前内置 ~26,000 行语料）
- [x] 多对象比较与优先级排序（v2）
- [x] 用户预分析模式识别与拆解（v2）
- [x] 事后回忆输入类型（v2）
- [x] 完整对话导出（v2）
- [x] 发展关系前置条件检查——第零步（v2）
- [x] 真实意图识别层——10类自我欺骗模式检测（v3）

## 免责声明

Read Between 是一个 AI skill 指令文件，**不是**心理治疗、精神科诊断、法律意见或危机热线。如果你正处于即时人身危险中，请拨打当地急救电话。
