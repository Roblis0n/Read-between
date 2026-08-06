# Memory Protocol — 长期记忆协议

love-me 的记忆系统让用户可以在需要时保存和回顾关系中的重要里程碑。所有记忆操作遵循"展示→确认→写入→重读验证"流程。

## 三种记忆模式

### 模式1：不记忆（默认）
- 当轮分析后不保存任何内容
- 下次对话从零开始
- 适用于：一次性问题、情绪宣泄、随手咨询

### 模式2：仅当前会话
- 会话内保持上下文
- 会话结束后自动清除
- 适用于：多轮分析同一个问题、但无需长期保留

### 模式3：长期档案
- 写入 `data-root.txt` 指定的数据目录
- 数据目录默认：`D:\Codex work\relationship-coach-data\`
- 适用于：值得长期保存的里程碑、决定、复盘

## 数据目录结构

```
relationship-coach-data/
├── profile.md                    # 用户偏好与底线
├── people/
│   └── p-<stable-id>.md          # 人物最少信息
├── relationships/
│   └── r-<stable-id>/
│       ├── overview.md           # 关系概览
│       ├── events/               # 事件记录
│       ├── conversations/        # 聊天摘要
│       ├── decisions/            # 决定快照
│       └── reviews/              # 复盘记录
└── exports/                      # 用户导出的数据
```

## 稳定标识（Stable ID）

使用不含姓名、地点等敏感语义的时间型稳定 ID：

- 人物：`p-20260805T143000+0800-a7k2`
- 关系：`r-20260805T143100+0800-f4m9`
- 事件：`e-20260805T143200+0800-q2d8`

显示名称与稳定 ID 分离。用户可使用昵称，但文件名只使用稳定 ID。

## 档案类型

### 用户档案 `profile.md`
只保存用户明确确认的长期偏好：沟通风格、关系底线、重要价值、常用表达和明确希望避免的模式。**不保存人格诊断**。

### 人物档案 `people/`
只保存识别当前关系所必需的最少信息。对方的性格、动机和心理状态若只是推断，必须放入"用户看法"或"待验证解释"，不能写入确认事实。

### 关系概览 `overview.md`
记录关系类型、当前状态（active/paused/ended/uncertain）、已确认时间线索、双方已明确的承诺和当前未决问题。

### 事件 `events/`
一次明确事件：发生时间、用户确认的事实、用户体验、当时未知项、来源和后续影响。原始事件不因后来结果而改写。

### 聊天摘要 `conversations/`
默认保存去标识化摘要，不是全文。分开记录：原话摘录、可观察行为、用户解释、模型替代解释、未决信号和当时建议。只有实际读取过的原句才能放在"原话摘录"。

### 决定 `decisions/`
记录用户当时选择、理由、假设、风险、计划、退出条件和复盘日期。写入后保持原始快照不变。

### 复盘 `reviews/`
记录实际结果、原假设是否成立、判断偏差、关系变化和可迁移教训。复盘不得用结果倒改原始事件或决定。

## 统一记录字段

每条系统创建的档案包含 YAML frontmatter：

```yaml
id: <stable-id>
type: profile|person|relationship|event|conversation|decision|review
created_at: <ISO 8601 with timezone>
status: active|paused|ended|uncertain|superseded
relationship_id: <关联关系 ID 或 null>
basis: user-confirmed|quoted-chat|agent-inference|external-source|mixed
confidence: confirmed|probable|possible|unknown|mixed
supersedes: <被取代的稳定 ID 或 null>
sensitivity: normal|sensitive|highly-sensitive
```

正文使用 Markdown，至少分清：**确认事实**、用户感受、用户解释、模型推断、未知项、行动和来源。

`agent-inference` 永远不能在后续读取时自动升级为 `user-confirmed`。

## 字段级敏感级别

| 级别 | 定义 | 处理 |
|------|------|------|
| normal | 不会造成伤害的一般信息 | 正常处理 |
| sensitive | 可能导致尴尬或不适 | 去标识化，限制上下文 |
| highly-sensitive | 可能导致严重伤害（私密影像、暴力经历、创伤细节） | 极敏感信息不因"分析有用"而自动建议保存；必须单独确认 |

## 保存流程

1. 判断是否出现长期有用的里程碑
2. 说明将以本地明文保存，建议去掉不必要的第三方识别信息
3. 展示拟保存的完整内容、准确路径、记录类型和操作
4. **等待用户在后续消息中明确确认**
5. 确认后写入，使用同目录临时文件和原子替换
6. 重新读取核对 ID、正文、路径和关联关系
7. 向用户报告实际写入结果

## 冲突处理

- 新事实与旧条目冲突时：保留旧条目，标记为 `superseded`
- 用户纠正事实时：新建纠正记录并关联旧 ID
- 不把一次冲突扩写为长期人格特征
- 不将缺少证据的"对方为什么这样"写入确认事实

## 读取与召回

- 用户提到某个人或关系时，先解析稳定 ID 或用户明确的昵称
- 只加载该关系的概览及当前问题需要的少量事件
- 读取旧判断时同时读取时间戳、依据和置信状态
- 存在同名人物或关系不明确时，必须先确认目标，不能猜测

## 过期与清理

- 过时推断自动降级（confidence 降为 unknown，标记需复核）
- 可配置保留期
- 删除前列出准确路径和保留内容，等待后续确认
- 删除后验证文件确已不存在
- 删除对象时同时清理索引和关联附件

## 导出

- 导出前展示范围、目标位置和是否包含聊天摘要
- 默认不导出高敏感附件
- 导出包含字段说明与来源，不只导出结论

## 脚本验证

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/validate_memory_store.ps1
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/validate_record.ps1
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/detect_cross_relationship_leakage.ps1
```
