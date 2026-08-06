<!-- op-finding:packet-sha256=ad09a70cc1e91e7fac6db8716709cad9ccd399f73f63f1abdaa1df87ee6965f3 -->
<!-- op-finding:decision=scout -->
<!-- op-finding:meta -->
# relationship-coach 现有计划与 GitHub 全量检索审阅报告

本报告独立于原 [plan.md](../../../plan.md)，不改写原计划。审阅日期为 2026-08-05，时区为 Asia/Shanghai。研究对象是会话 019fcb18-c9a2-7410-9544-a4079e8b2d5b 所形成的 relationship-coach 独立 Skill 方案，以及 GitHub 上可用于对照的恋爱聊天、关系教练、伴侣经营、婚姻支持、关系记忆和安全项目。

“全量搜索”在这里采用可复核口径：执行 23 个 GitHub 查询，保留 124 条查询或打开回执，打开 42 个仓库或 issue 来源；第一轮从六组主题查询的原始命中中建立 24 个候选分母，随后补查真实 issue、核心 README、SKILL、知识文件、测试结果和相邻赛道。GitHub 是动态集合，报告不声称枚举平台历史上的每一个仓库；它声称覆盖了截至当日、按所列关键词和相邻工作流能够系统检出的主要公开方向，并完整保留查询式、原始命中数、筛选结果和反证。

访问限制：GitHub 连接器未登录，因此研究使用公开 GitHub API 与公开原始文件；私有仓库、已删除内容、未被 GitHub 搜索索引的仓库和站外闭源产品不在证据范围内。Stars 仅用于观察关注度，不作为科学正确性或安全性的证明。

Request: 019fcb18-c9a2-7410-9544-a4079e8b2d5b
阅读这个会话，并且我打算新建一个skill，专门用于感性情感方面，用于与女生聊天或者约会、表白等一系列追求、及对象到结婚的一切聊天。阅读现有的plan并全量搜索github内容，告诉我哪里需要修改，补充哪些功能，github上有哪些相似的项目可以仿照，写一份markdown报告
Objective: 审阅现有 relationship-coach 设计，并系统检索 GitHub 上关系沟通、约会聊天、伴侣支持、关系记忆与安全治理项目，形成可执行的修改与功能补充报告。
Scope kind: topic_bounded
User topic terms: ["skill", "聊天", "约会", "表白", "追求", "对象", "结婚"]
Mode: scout
[retrieval-log] Session ID: "f5018dfa-f664-4487-919f-ad704d566635"
[retrieval-log] Receipt count: 124
[retrieval-log] Chain head: "814e8269cdaba597e61bf7be9ae529388ac9a4498a742473a1785cff9762b287"

<!-- op-finding:verdict -->
## 结论先行

结论是：独立新建 relationship-coach 的方向正确，现有 plan.md 的基础也明显好于大多数公开恋爱 Skill；但当前计划还不能直接进入一次性实现。它已经解决“定位、情绪承接、事实与推测分离、明确授权记忆、古籍桥接、安全优先”等核心原则，却缺少五类生产级契约：全生命周期状态路由、聊天输入协议、长期伴侣与婚姻知识、字段级隐私与来源治理、对抗性测试。

GitHub 没有出现一个可以原样照搬的完整项目。最接近的直接项目覆盖较广，但有的 GitHub API 未识别标准许可，有的混入 PUA、固定节奏、依恋诊断、伪概率或真实伴侣人格克隆。正确做法是“组合借鉴能力、独立重写规则与实现”，而不是 fork 一个项目后换名字。

本次为 SCOUT：共 24 个首轮候选、1 个主题域、16 个保留深读方向、1 个直接对照评分卡。评分卡只用于审计最接近项目的能力缺口，不选择 GitHub 仓库作为赢家，也不授权实现。

<!-- op-finding:research-log -->
## 研究过程

研究顺序不是先找热门仓库再拼结论，而是依次完成：项目地貌、真实痛点、相邻替代与组合缺口、反向否定。第一轮原始命中数很大，但包含大量 README 关键词噪声；因此只有实际打开并能归入候选分母的项目才进入后续比较。

[R1] 建立直接项目分母。重点确认哪些项目真正处理聊天、约会、关系判断、训练、伴侣经营或安全，而不是只在 README 中偶然出现关键词。

[R2] 查看公开 issue、核心文件和评测。最有价值的证据不是宣传语，而是依赖消失、时间戳崩溃、格式缺失、原始 JSON 输出和评测失败这些真实摩擦。

[R3] 扩展到关系日志、婚姻辅导和隐私会话记忆。目的不是扩大列表，而是确认哪些能力已有成熟工程实现，哪些仍是组合缺口。

[R4] 主动攻击“有必要新建”的假设，搜索高关注度、许可清晰的成熟替代品和人物蒸馏生态。结果削弱了“完全从零创新”的说法，但没有发现能安全覆盖完整生命周期的单一替代品。

[R1] Kind: "landscape"
[R1] Objective: "建立恋爱聊天、关系教练与伴侣支持 GitHub 项目的完整初始分母并区分直接相关与误命中。"
[R1] Queries: ["\"dating coach\" skill in:name,description,readme fork:false","\"relationship coach\" skill in:name,description,readme fork:false","\"love advice\" skill in:name,description,readme fork:false","\"恋爱\" skill in:name,description,readme fork:false","\"情圣\" skill in:name,description,readme fork:false","\"聊天截图\" skill in:name,description,readme fork:false"]
[R1] Tools: ["github_api"]
[R1] Searched at: "2026-08-05"
[R1] Sources: ["S1","S2","S3","S4","S5","S6","S7","S8","S9","S10","S11","S12","S13","S14","S15","S16","S17","S18","S19","S20","S21","S22","S23","S24"]
[R1] Claims: ["C1"]
[R1] Builds on: []
[R1] Query receipts: ["RR1","RR2","RR3","RR4","RR5","RR6"]
[R1] Finding 1: "六组用户主题查询产生大量关键词命中，但深读后只有部分仓库真正覆盖关系分析、聊天或长期伴侣支持。"
[R1] Finding 2: "直接项目高度碎片化：聊天导入、追求话术、训练沙盒、长期伴侣和安全支持分别由不同仓库承担。"
[R1] Next question [Q1]: "这些项目的真实用户在哪些导入、输出、可靠性和场景覆盖环节反复遇到问题？"
[R2] Kind: "pain"
[R2] Objective: "通过公开议题、核心文件和测试记录确认用户反复遇到的输入、输出、可靠性、安全与长期使用痛点。"
[R2] Queries: ["repo:863401402/she-love-me is:issue","repo:tomwong001/qingsheng-skill is:issue","repo:powerycy/goutoujunshi is:issue"]
[R2] Tools: ["github_api"]
[R2] Searched at: "2026-08-05"
[R2] Sources: ["S8","S9","S14","S16","S18","S19","S21","S24","S25","S26","S27","S28","S29","S30","S31","S32","S33","S34"]
[R2] Claims: ["C2","C3","C4","C5","C6","C7"]
[R2] Builds on: ["Q1"]
[R2] Query receipts: ["RR31","RR32","RR33"]
[R2] Finding 1: "真实议题集中在依赖失效、时间戳异常、Markdown 与语音等输入格式缺口，以及结构化结果可读性不足。"
[R2] Finding 2: "核心文件显示许多项目把统计相关性升级为人格诊断或结局预测，造成过度自信和错误行动风险。"
[R2] Next question [Q2]: "哪些直接或相邻开源方案已经覆盖这些能力，它们仍留下哪些可验证的组合缺口？"
[R3] Kind: "gap"
[R3] Objective: "比较直接竞品与关系日志、婚姻辅导、隐私会话记忆等相邻方案，确认组合缺口而非单点功能空白。"
[R3] Queries: ["”couples app” communication relationship in:name,description,readme fork:false","”relationship journal” couple in:name,description,readme fork:false","”marriage counseling” chatbot in:name,description,readme fork:false","”nonviolent communication” chatbot relationship in:name,description,readme fork:false","couple communication in:name,description fork:false","”relationship journal” in:name,description fork:false","”marriage counseling” in:name,description fork:false","”nonviolent communication” chatbot in:name,description fork:false","”couples therapy” in:name,description fork:false","”relationship wellness” in:name,description fork:false","”couples counseling” chatbot in:name,description fork:false"]
[R3] Tools: ["github_api"]
[R3] Searched at: "2026-08-05"
[R3] Sources: ["S3","S7","S16","S19","S21","S35","S36","S37","S38"]
[R3] Claims: ["C8","C9","C10","C11","C12"]
[R3] Builds on: ["Q2"]
[R3] Query receipts: ["RR92","RR93","RR94","RR95","RR96","RR97","RR98","RR99","RR100","RR101","RR102"]
[R3] Finding 1: "相邻项目证明离线关系日志、加密同步、语音转写、来源追踪和多专家路由均可实现，但没有单一方案完成安全的全生命周期关系 Skill。"
[R3] Finding 2: "最可行的差异不是创造新的恋爱理论，而是把证据校准、聊天输入、阶段路由、长期经营、记忆治理和安全边界统一。"
[R3] Next question [Q3]: "是否已经存在高采用度且许可清晰的成熟项目，足以让新建独立 Skill 变得冗余？"
[R4] Kind: "disconfirmation"
[R4] Objective: "主动寻找高采用度成熟替代品和人格蒸馏生态，检验是否应直接复用现有项目而不是新建独立 Skill。"
[R4] Queries: ["”relationship coach” agent skill stars:>10 in:name,description,readme fork:false","恋爱 skill stars:>50 in:name,description,readme fork:false","”relationship coach” skill license:mit in:name,description,readme fork:false"]
[R4] Tools: ["github_api"]
[R4] Searched at: "2026-08-05"
[R4] Sources: ["S39","S40","S41","S42"]
[R4] Claims: ["C13","C14"]
[R4] Builds on: ["Q3"]
[R4] Query receipts: ["RR103","RR104","RR105"]
[R4] Finding 1: "高关注度项目证明市场需求真实，但主流热门项目多是单一人物视角、前任人格蒸馏或项目索引，未完整覆盖安全生命周期。"
[R4] Finding 2: "人格蒸馏生态的热度同时构成反证与风险：它说明用户需要个性化，但不应把真实伴侣克隆成可操控代理。"

<!-- op-finding:source-ledger -->
## 来源台账

来源分为四组：S1–S24 是首轮仓库分母；S25–S34 是直接反映需求和故障的公开 issue；S35–S38 是关系日志、伴侣应用、婚姻辅导与会话记忆相邻方案；S39–S42 用于反证高关注度人物 Skill 和蒸馏生态。所有来源均在 2026-08-05 打开，仓库来源只证明其自身公开内容，不能把作者自述自动提升为学术证据。

重点来源包括 [goutoujunshi](https://github.com/powerycy/goutoujunshi)、[zhiji-relationship](https://github.com/1wu-davy-2/zhiji-relationship)、[she-love-me](https://github.com/863401402/she-love-me)、[relationship-training-skill](https://github.com/TammyTan516/relationship-training-skill)、[qingsheng-skill](https://github.com/tomwong001/qingsheng-skill)、[partner-skill](https://github.com/NatalieCao323/partner-skill)、[npd-relationship-coach](https://github.com/FrankHu-HK/npd-relationship-coach)、[Tilly](https://github.com/carlassmann/tilly) 和 [minutes](https://github.com/silverstein/minutes)。

[S1] Title: "Mayuqi-crypto/HowToGetAlongWithGirls"
[S1] URL: "https://github.com/Mayuqi-crypto/HowToGetAlongWithGirls"
[S1] Source type: "github_repo"
[S1] Primary: true
[S1] Observed at: "2026-08-05"
[S1] Open receipts: ["RR7"]
[S2] Title: "lgl1996521/love-advise-skill"
[S2] URL: "https://github.com/lgl1996521/love-advise-skill"
[S2] Source type: "github_repo"
[S2] Primary: true
[S2] Observed at: "2026-08-05"
[S2] Open receipts: ["RR8"]
[S3] Title: "0xmetaschool/dating-coach-gpt"
[S3] URL: "https://github.com/0xmetaschool/dating-coach-gpt"
[S3] Source type: "github_repo"
[S3] Primary: true
[S3] Observed at: "2026-08-05"
[S3] Open receipts: ["RR9","RR120"]
[S4] Title: "ddyuan-spec/dating-coach-skill"
[S4] URL: "https://github.com/ddyuan-spec/dating-coach-skill"
[S4] Source type: "github_repo"
[S4] Primary: true
[S4] Observed at: "2026-08-05"
[S4] Open receipts: ["RR10"]
[S5] Title: "CARay1502/ai-relationship-coach"
[S5] URL: "https://github.com/CARay1502/ai-relationship-coach"
[S5] Source type: "github_repo"
[S5] Primary: true
[S5] Observed at: "2026-08-05"
[S5] Open receipts: ["RR11"]
[S6] Title: "narasim-teja/dating-coach"
[S6] URL: "https://github.com/narasim-teja/dating-coach"
[S6] Source type: "github_repo"
[S6] Primary: true
[S6] Observed at: "2026-08-05"
[S6] Open receipts: ["RR12"]
[S7] Title: "cozer-1024/openclaw-relationship-coach"
[S7] URL: "https://github.com/cozer-1024/openclaw-relationship-coach"
[S7] Source type: "github_repo"
[S7] Primary: true
[S7] Observed at: "2026-08-05"
[S7] Open receipts: ["RR13","RR121"]
[S8] Title: "FrankHu-HK/npd-relationship-coach"
[S8] URL: "https://github.com/FrankHu-HK/npd-relationship-coach"
[S8] Source type: "github_repo"
[S8] Primary: true
[S8] Observed at: "2026-08-05"
[S8] Open receipts: ["RR14","RR59","RR67","RR84","RR85"]
[S9] Title: "1wu-davy-2/zhiji-relationship"
[S9] URL: "https://github.com/1wu-davy-2/zhiji-relationship"
[S9] Source type: "github_repo"
[S9] Primary: true
[S9] Observed at: "2026-08-05"
[S9] Open receipts: ["RR15","RR60","RR68","RR86","RR87","RR88","RR89","RR90"]
[S10] Title: "replyher/relationship-coach-skill"
[S10] URL: "https://github.com/replyher/relationship-coach-skill"
[S10] Source type: "github_repo"
[S10] Primary: true
[S10] Observed at: "2026-08-05"
[S10] Open receipts: ["RR16"]
[S11] Title: "replyher/love-reply-skill"
[S11] URL: "https://github.com/replyher/love-reply-skill"
[S11] Source type: "github_repo"
[S11] Primary: true
[S11] Observed at: "2026-08-05"
[S11] Open receipts: ["RR17"]
[S12] Title: "BRAINCHN/kuntai"
[S12] URL: "https://github.com/BRAINCHN/kuntai"
[S12] Source type: "github_repo"
[S12] Primary: true
[S12] Observed at: "2026-08-05"
[S12] Open receipts: ["RR18"]
[S13] Title: "xixu-me/awesome-persona-distill-skills"
[S13] URL: "https://github.com/xixu-me/awesome-persona-distill-skills"
[S13] Source type: "github_repo"
[S13] Primary: true
[S13] Observed at: "2026-08-05"
[S13] Open receipts: ["RR19"]
[S14] Title: "powerycy/goutoujunshi"
[S14] URL: "https://github.com/powerycy/goutoujunshi"
[S14] Source type: "github_repo"
[S14] Primary: true
[S14] Observed at: "2026-08-05"
[S14] Open receipts: ["RR20","RR44","RR49","RR54","RR62","RR70","RR71","RR72"]
[S15] Title: "CNWU16/vedic-astro-skills"
[S15] URL: "https://github.com/CNWU16/vedic-astro-skills"
[S15] Source type: "github_repo"
[S15] Primary: true
[S15] Observed at: "2026-08-05"
[S15] Open receipts: ["RR21"]
[S16] Title: "863401402/she-love-me"
[S16] URL: "https://github.com/863401402/she-love-me"
[S16] Source type: "github_repo"
[S16] Primary: true
[S16] Observed at: "2026-08-05"
[S16] Open receipts: ["RR22","RR45","RR51","RR55","RR63","RR73","RR74","RR122"]
[S17] Title: "Aubrey0806/relationship-ququ-skill"
[S17] URL: "https://github.com/Aubrey0806/relationship-ququ-skill"
[S17] Source type: "github_repo"
[S17] Primary: true
[S17] Observed at: "2026-08-05"
[S17] Open receipts: ["RR23"]
[S18] Title: "TammyTan516/relationship-training-skill"
[S18] URL: "https://github.com/TammyTan516/relationship-training-skill"
[S18] Source type: "github_repo"
[S18] Primary: true
[S18] Observed at: "2026-08-05"
[S18] Open receipts: ["RR24","RR46","RR50","RR56","RR64","RR75","RR76","RR77"]
[S19] Title: "tomwong001/qingsheng-skill"
[S19] URL: "https://github.com/tomwong001/qingsheng-skill"
[S19] Source type: "github_repo"
[S19] Primary: true
[S19] Observed at: "2026-08-05"
[S19] Open receipts: ["RR25","RR47","RR52","RR57","RR65","RR78","RR79","RR80","RR123"]
[S20] Title: "baller-coder/jiaoyuan-love"
[S20] URL: "https://github.com/baller-coder/jiaoyuan-love"
[S20] Source type: "github_repo"
[S20] Primary: true
[S20] Observed at: "2026-08-05"
[S20] Open receipts: ["RR26"]
[S21] Title: "NatalieCao323/partner-skill"
[S21] URL: "https://github.com/NatalieCao323/partner-skill"
[S21] Source type: "github_repo"
[S21] Primary: true
[S21] Observed at: "2026-08-05"
[S21] Open receipts: ["RR27","RR48","RR53","RR58","RR66","RR81","RR82","RR83","RR124"]
[S22] Title: "Sylvara-Lin/SereneChat-skill"
[S22] URL: "https://github.com/Sylvara-Lin/SereneChat-skill"
[S22] Source type: "github_repo"
[S22] Primary: true
[S22] Observed at: "2026-08-05"
[S22] Open receipts: ["RR28"]
[S23] Title: "BboTTM/heartflow-skill"
[S23] URL: "https://github.com/BboTTM/heartflow-skill"
[S23] Source type: "github_repo"
[S23] Primary: true
[S23] Observed at: "2026-08-05"
[S23] Open receipts: ["RR29"]
[S24] Title: "duck-ai-yy/ex-ai"
[S24] URL: "https://github.com/duck-ai-yy/ex-ai"
[S24] Source type: "github_repo"
[S24] Primary: true
[S24] Observed at: "2026-08-05"
[S24] Open receipts: ["RR30","RR61","RR69","RR91"]
[S25] Title: "she-love-me issue #22: upstream dependency disappeared"
[S25] URL: "https://github.com/863401402/she-love-me/issues/22"
[S25] Source type: "github_issue"
[S25] Primary: true
[S25] Observed at: "2026-08-05"
[S25] Open receipts: ["RR34"]
[S26] Title: "she-love-me issue #21: support Markdown exports"
[S26] URL: "https://github.com/863401402/she-love-me/issues/21"
[S26] Source type: "github_issue"
[S26] Primary: true
[S26] Observed at: "2026-08-05"
[S26] Open receipts: ["RR35"]
[S27] Title: "she-love-me issue #20: support voice-message analysis"
[S27] URL: "https://github.com/863401402/she-love-me/issues/20"
[S27] Source type: "github_issue"
[S27] Primary: true
[S27] Observed at: "2026-08-05"
[S27] Open receipts: ["RR36"]
[S28] Title: "she-love-me issue #19: timestamp unit crash and workaround"
[S28] URL: "https://github.com/863401402/she-love-me/issues/19"
[S28] Source type: "github_issue"
[S28] Primary: true
[S28] Observed at: "2026-08-05"
[S28] Open receipts: ["RR37"]
[S29] Title: "she-love-me issue #17: raw JSON report output"
[S29] URL: "https://github.com/863401402/she-love-me/issues/17"
[S29] Source type: "github_issue"
[S29] Primary: true
[S29] Observed at: "2026-08-05"
[S29] Open receipts: ["RR38"]
[S30] Title: "she-love-me issue #5: Enterprise WeChat support"
[S30] URL: "https://github.com/863401402/she-love-me/issues/5"
[S30] Source type: "github_issue"
[S30] Primary: true
[S30] Observed at: "2026-08-05"
[S30] Open receipts: ["RR39"]
[S31] Title: "qingsheng-skill issue #22: WeChat and QQ community"
[S31] URL: "https://github.com/tomwong001/qingsheng-skill/issues/22"
[S31] Source type: "github_issue"
[S31] Primary: true
[S31] Observed at: "2026-08-05"
[S31] Open receipts: ["RR40"]
[S32] Title: "qingsheng-skill issue #21: CodeGuilds registry listing"
[S32] URL: "https://github.com/tomwong001/qingsheng-skill/issues/21"
[S32] Source type: "github_issue"
[S32] Primary: true
[S32] Observed at: "2026-08-05"
[S32] Open receipts: ["RR41"]
[S33] Title: "goutoujunshi issue #10: ChatLab integration"
[S33] URL: "https://github.com/powerycy/goutoujunshi/issues/10"
[S33] Source type: "github_issue"
[S33] Primary: true
[S33] Observed at: "2026-08-05"
[S33] Open receipts: ["RR42"]
[S34] Title: "goutoujunshi issue #3: SkillHub and WeChat-Hermes integration"
[S34] URL: "https://github.com/powerycy/goutoujunshi/issues/3"
[S34] Source type: "github_issue"
[S34] Primary: true
[S34] Observed at: "2026-08-05"
[S34] Open receipts: ["RR43"]
[S35] Title: "carlassmann/tilly"
[S35] URL: "https://github.com/carlassmann/tilly"
[S35] Source type: "github_repo"
[S35] Primary: true
[S35] Observed at: "2026-08-05"
[S35] Open receipts: ["RR106","RR114"]
[S36] Title: "Codernauti/Sweetie"
[S36] URL: "https://github.com/Codernauti/Sweetie"
[S36] Source type: "github_repo"
[S36] Primary: true
[S36] Observed at: "2026-08-05"
[S36] Open receipts: ["RR107","RR115"]
[S37] Title: "kamilersz/Marriage-Counselor-Agent"
[S37] URL: "https://github.com/kamilersz/Marriage-Counselor-Agent"
[S37] Source type: "github_repo"
[S37] Primary: true
[S37] Observed at: "2026-08-05"
[S37] Open receipts: ["RR108","RR116"]
[S38] Title: "silverstein/minutes"
[S38] URL: "https://github.com/silverstein/minutes"
[S38] Source type: "github_repo"
[S38] Primary: true
[S38] Observed at: "2026-08-05"
[S38] Open receipts: ["RR109","RR117"]
[S39] Title: "hotcoffeeshake/tong-jincheng-skill"
[S39] URL: "https://github.com/hotcoffeeshake/tong-jincheng-skill"
[S39] Source type: "github_repo"
[S39] Primary: true
[S39] Observed at: "2026-08-05"
[S39] Open receipts: ["RR110","RR118"]
[S40] Title: "perkfly/ex-skill"
[S40] URL: "https://github.com/perkfly/ex-skill"
[S40] Source type: "github_repo"
[S40] Primary: true
[S40] Observed at: "2026-08-05"
[S40] Open receipts: ["RR111","RR119"]
[S41] Title: "tmstack/awesome-persona-skills"
[S41] URL: "https://github.com/tmstack/awesome-persona-skills"
[S41] Source type: "github_repo"
[S41] Primary: true
[S41] Observed at: "2026-08-05"
[S41] Open receipts: ["RR112"]
[S42] Title: "mliu98/awesome-human-distillation"
[S42] URL: "https://github.com/mliu98/awesome-human-distillation"
[S42] Source type: "github_repo"
[S42] Primary: true
[S42] Observed at: "2026-08-05"
[S42] Open receipts: ["RR113"]

<!-- op-finding:trend-landscape -->
## GitHub 项目地貌

### 1. 直接关系教练

[goutoujunshi](https://github.com/powerycy/goutoujunshi) 的覆盖面最广：情绪承接、事实/推测/未知、聊天材料、长期记忆、知识分层、婚姻家庭、性与安全。它最值得借鉴的是行为内核与知识库分层、只读导入预览、用户同意后的有界本地记忆、一次只加载少量参考；不应直接复制的原因是许可证识别与项目边界仍需单独核验，而且本项目必须保留自己的记忆协议和 past-wis 桥接。

[zhiji-relationship](https://github.com/1wu-davy-2/zhiji-relationship) 展示了证据分级、反 PUA、同意、婚姻生命周期、反刻板印象和风格层不绕过安全边界的集成测试。它在内容结构上很接近应补进 plan.md 的部分，但 GitHub API 未识别标准许可证，所以适合研究结构与测试思想，不适合复制文本。

### 2. 聊天导入与证据输出

[she-love-me](https://github.com/863401402/she-love-me) 证明了联系人隔离目录、微信/QQ 导入、分层采样、统计层与文本层分开、证据不足输出 null、报告字段带 reason/evidence_level/observable_signals 的价值。它的 issue 同时证明：依赖消失、秒/毫秒时间戳、Markdown、语音和企业微信会成为真实故障面。需要借鉴输入管线和字段契约，不能照搬依恋诊断、固定指数和“被爱/冷淡”分数。

### 3. 场景训练与即时回复

[relationship-training-skill](https://github.com/TammyTan516/relationship-training-skill) 提供场景路由、实时/事后反馈、复盘报告和纠错记忆。可借鉴“练习—反馈—复盘”，但训练对象只能是明确标注的假设角色分支，不能用真实聊天把对方做成可持续人格模拟。

[qingsheng-skill](https://github.com/tomwong001/qingsheng-skill) 有平台适配、七阶段、截图与公开 eval。它的公开一次评测为 18 例仅 5 例通过，失败主要来自过度追问而不给基础答案，这提醒新 Skill 必须遵循“先给当前信息下的可用结果，再提出最少必要问题”。它也是负面样本：推拉、稀缺、故意延迟、框架控制、Kino 阶梯和“明确时限”不能进入新 Skill。

### 4. 长期伴侣与婚姻

[partner-skill](https://github.com/NatalieCao323/partner-skill) 列出冲突、礼物、家务、财务、同居、双方家庭、职业、健康和未来规划等二十三类场景，这正好暴露现有 plan.md 对“对象到结婚”的覆盖仍偏抽象。可借鉴场景目录、纠错层、版本回滚；必须拒绝 RQI 公式、虚构状态转移概率、固定时限干预和“把伴侣蒸馏成 living AI Skill”。

[Marriage-Counselor-Agent](https://github.com/kamilersz/Marriage-Counselor-Agent) 展示倾听、情绪、评估、目标、冲突、价值、修复、亲密、边界和压力的专家分工。它说明婚姻支持不能只有回复话术，但低采用度与无清晰许可证使其只能作为功能地图。

### 5. 本地关系记忆与隐私

[Tilly](https://github.com/carlassmann/tilly) 的离线优先、浏览器加密、完整 JSON 导入导出和“只有 AI 功能才向提供商发送用户选定内容”很值得借鉴。它证明关系记忆应是用户拥有、可导出、可离线工作的资产。

[minutes](https://github.com/silverstein/minutes) 的本地转写、说话人识别、结构化 Markdown、来源、策略授权检索和同意提示，比把所有聊天塞进一个 profile 更成熟。新 Skill 可借鉴其“当前授权范围的临时投影”，避免一次查询加载整个关系档案。

### 6. 人物蒸馏与数字分身

[tong-jincheng-skill](https://github.com/hotcoffeeshake/tong-jincheng-skill)、[ex-skill](https://github.com/perkfly/ex-skill) 和 [ex-ai](https://github.com/duck-ai-yy/ex-ai) 说明用户喜欢鲜明表达、聊天解析、增量更新和版本管理。可借鉴“风格只是表现层”“解析器可本地运行”“纠错和回滚”；不可借鉴真实人物冒充、前任/伴侣数字克隆、用星座或依恋标签补全人格、制造情感依赖。

热度与可靠性必须分开。高 Stars 说明传播和需求，不证明建议科学、合规或适合用户本人；低 Stars 项目也可能包含优秀的安全或输入设计。

<!-- op-finding:scope-coverage -->
## 检索范围与首轮候选分母

首轮六个查询的原始命中分别为 77、269、16、460、16、170。它们不能相加当作独立项目数，因为存在重复和 README 噪声。实际逐项记入候选台账的是 24 个仓库，其中 16 个进入深读，8 个因误命中、证据不足、占星核心、人格模拟或操控风险被拒绝。所有候选都属于 consumer_local_first 主题域；AI、Skill、OCR 和 PWA 只作为技术标签。

| ID | 项目 | 处置 | 核心理由 |
|---|---|---|---|
| L8/L9/L14 | 安全与综合关系 Skill | 保留 | 覆盖安全、证据或全周期结构 |
| L16/L19 | 聊天导入与回复 | 保留 | 输入管线、场景路由和公开问题有证据 |
| L18/L21 | 训练与长期伴侣 | 保留 | 练习、场景和记忆值得拆解 |
| L15 | 占星恋爱工具 | 拒绝 | 不能承担关系判断证据 |
| L22/L23 | 虚拟伴侣与人格模拟 | 拒绝 | 冒充、依赖和伪科学风险 |
| L12/L20 | 误命中或说明不足 | 拒绝 | 无法支撑设计判断 |

[LQ1] Query: "\"dating coach\" skill in:name,description,readme fork:false"
[LQ1] Origin: "user_term"
[LQ1] Domain: "consumer_local_first"
[LQ1] Sources: ["S1","S2","S3","S4","S5","S6"]
[LQ1] Query receipt: "RR1"
[LQ1] Result count: 77
[LQ1] Inspected count: 6
[LQ1] Inspected candidates: ["L1","L2","L3","L4","L5","L6"]
[LQ2] Query: "\"relationship coach\" skill in:name,description,readme fork:false"
[LQ2] Origin: "user_term"
[LQ2] Domain: "consumer_local_first"
[LQ2] Sources: ["S7","S5","S8","S9","S10","S11"]
[LQ2] Query receipt: "RR2"
[LQ2] Result count: 269
[LQ2] Inspected count: 6
[LQ2] Inspected candidates: ["L7","L5","L8","L9","L10","L11"]
[LQ3] Query: "\"love advice\" skill in:name,description,readme fork:false"
[LQ3] Origin: "user_term"
[LQ3] Domain: "consumer_local_first"
[LQ3] Sources: ["S12"]
[LQ3] Query receipt: "RR3"
[LQ3] Result count: 16
[LQ3] Inspected count: 1
[LQ3] Inspected candidates: ["L12"]
[LQ4] Query: "\"恋爱\" skill in:name,description,readme fork:false"
[LQ4] Origin: "user_term"
[LQ4] Domain: "consumer_local_first"
[LQ4] Sources: ["S13","S14","S15","S16","S17","S18"]
[LQ4] Query receipt: "RR4"
[LQ4] Result count: 460
[LQ4] Inspected count: 6
[LQ4] Inspected candidates: ["L13","L14","L15","L16","L17","L18"]
[LQ5] Query: "\"情圣\" skill in:name,description,readme fork:false"
[LQ5] Origin: "user_term"
[LQ5] Domain: "consumer_local_first"
[LQ5] Sources: ["S19","S20"]
[LQ5] Query receipt: "RR5"
[LQ5] Result count: 16
[LQ5] Inspected count: 2
[LQ5] Inspected candidates: ["L19","L20"]
[LQ6] Query: "\"聊天截图\" skill in:name,description,readme fork:false"
[LQ6] Origin: "user_term"
[LQ6] Domain: "consumer_local_first"
[LQ6] Sources: ["S14","S19","S21","S22","S23","S24"]
[LQ6] Query receipt: "RR6"
[LQ6] Result count: 170
[LQ6] Inspected count: 6
[LQ6] Inspected candidates: ["L14","L19","L21","L22","L23","L24"]
[L1] Name: "Mayuqi-crypto/HowToGetAlongWithGirls"
[L1] Entity URL: "https://github.com/Mayuqi-crypto/HowToGetAlongWithGirls"
[L1] Domain: "consumer_local_first"
[L1] Technology tags: ["dating-coach","agent-skill"]
[L1] Sources: ["S1"]
[L1] Query records: ["LQ1"]
[L1] Disposition: "shortlisted"
[L1] Selection reason: "直接提供约会教练 Skill 与参考资料，适合观察最小化文件组织，但社区与许可信息不足。"
[L2] Name: "lgl1996521/love-advise-skill"
[L2] Entity URL: "https://github.com/lgl1996521/love-advise-skill"
[L2] Domain: "consumer_local_first"
[L2] Technology tags: ["dating-advice","agent-skill"]
[L2] Sources: ["S2"]
[L2] Query records: ["LQ1"]
[L2] Disposition: "shortlisted"
[L2] Selection reason: "直接面向男性恋爱指导且采用 MIT 许可，可作为反例审查其进化心理与性别化假设。"
[L3] Name: "0xmetaschool/dating-coach-gpt"
[L3] Entity URL: "https://github.com/0xmetaschool/dating-coach-gpt"
[L3] Domain: "consumer_local_first"
[L3] Technology tags: ["web-app","dating-coach"]
[L3] Sources: ["S3"]
[L3] Query records: ["LQ1"]
[L3] Disposition: "shortlisted"
[L3] Selection reason: "提供可运行的约会教练 Web 原型和 MIT 许可，可用于比较产品入口与对话体验。"
[L4] Name: "ddyuan-spec/dating-coach-skill"
[L4] Entity URL: "https://github.com/ddyuan-spec/dating-coach-skill"
[L4] Domain: "consumer_local_first"
[L4] Technology tags: ["dating-coach","agent-skill"]
[L4] Sources: ["S4"]
[L4] Query records: ["LQ1"]
[L4] Disposition: "shortlisted"
[L4] Selection reason: "覆盖从接触到约会的追求链路，虽采用度很低但可审查阶段路由和场景清单。"
[L5] Name: "CARay1502/ai-relationship-coach"
[L5] Entity URL: "https://github.com/CARay1502/ai-relationship-coach"
[L5] Domain: "consumer_local_first"
[L5] Technology tags: ["web-app","relationship-coach"]
[L5] Sources: ["S5"]
[L5] Query records: ["LQ1","LQ2"]
[L5] Disposition: "shortlisted"
[L5] Selection reason: "属于关系教练聊天产品原型，可比较通用聊天机器人与本地 Skill 在记忆和安全上的差异。"
[L6] Name: "narasim-teja/dating-coach"
[L6] Entity URL: "https://github.com/narasim-teja/dating-coach"
[L6] Domain: "consumer_local_first"
[L6] Technology tags: ["dating-coach"]
[L6] Sources: ["S6"]
[L6] Query records: ["LQ1"]
[L6] Disposition: "rejected"
[L6] Selection reason: "仓库规模和说明均不足以支持深度借鉴，未发现独特的安全、记忆或证据治理能力。"
[L7] Name: "cozer-1024/openclaw-relationship-coach"
[L7] Entity URL: "https://github.com/cozer-1024/openclaw-relationship-coach"
[L7] Domain: "consumer_local_first"
[L7] Technology tags: ["openclaw","relationship-course"]
[L7] Sources: ["S7"]
[L7] Query records: ["LQ2"]
[L7] Disposition: "shortlisted"
[L7] Selection reason: "以大量课程覆盖聊天、约会、推进和长期关系，适合借鉴知识路由但需要核查课程式断言。"
[L8] Name: "FrankHu-HK/npd-relationship-coach"
[L8] Entity URL: "https://github.com/FrankHu-HK/npd-relationship-coach"
[L8] Domain: "consumer_local_first"
[L8] Technology tags: ["safety","abuse-recovery"]
[L8] Sources: ["S8"]
[L8] Query records: ["LQ2"]
[L8] Disposition: "shortlisted"
[L8] Selection reason: "把操控识别、边界训练和危机分流放在核心位置，是安全模块和拒绝路径的重要参考。"
[L9] Name: "1wu-davy-2/zhiji-relationship"
[L9] Entity URL: "https://github.com/1wu-davy-2/zhiji-relationship"
[L9] Domain: "consumer_local_first"
[L9] Technology tags: ["codex-skill","evidence-governance"]
[L9] Sources: ["S9"]
[L9] Query records: ["LQ2"]
[L9] Disposition: "shortlisted"
[L9] Selection reason: "知识分级、反操控、婚姻生命周期和集成测试较完整，是架构上最接近现有计划的参考。"
[L10] Name: "replyher/relationship-coach-skill"
[L10] Entity URL: "https://github.com/replyher/relationship-coach-skill"
[L10] Domain: "consumer_local_first"
[L10] Technology tags: ["agent-skill","relationship-coach"]
[L10] Sources: ["S10"]
[L10] Query records: ["LQ2"]
[L10] Disposition: "rejected"
[L10] Selection reason: "虽名称直接相关且有 MIT 许可，但采用度为零、公开材料有限，不能提供足够独特证据。"
[L11] Name: "replyher/love-reply-skill"
[L11] Entity URL: "https://github.com/replyher/love-reply-skill"
[L11] Domain: "consumer_local_first"
[L11] Technology tags: ["message-drafting","agent-skill"]
[L11] Sources: ["S11"]
[L11] Query records: ["LQ2"]
[L11] Disposition: "rejected"
[L11] Selection reason: "只聚焦回复生成且采用度为零，缺少关系判断、长期经营、隐私和高风险治理。"
[L12] Name: "BRAINCHN/kuntai"
[L12] Entity URL: "https://github.com/BRAINCHN/kuntai"
[L12] Domain: "consumer_local_first"
[L12] Technology tags: ["generic-advice"]
[L12] Sources: ["S12"]
[L12] Query records: ["LQ3"]
[L12] Disposition: "rejected"
[L12] Selection reason: "关键词命中但实际为通用强硬建议项目，不是恋爱或亲密关系专用能力，属于误命中。"
[L13] Name: "xixu-me/awesome-persona-distill-skills"
[L13] Entity URL: "https://github.com/xixu-me/awesome-persona-distill-skills"
[L13] Domain: "consumer_local_first"
[L13] Technology tags: ["awesome-list","agent-skills"]
[L13] Sources: ["S13"]
[L13] Query records: ["LQ4"]
[L13] Disposition: "shortlisted"
[L13] Selection reason: "高关注度的人物与关系 Skill 索引，适合作为发现渠道和打包方式参考，但不是关系教练本身。"
[L14] Name: "powerycy/goutoujunshi"
[L14] Entity URL: "https://github.com/powerycy/goutoujunshi"
[L14] Domain: "consumer_local_first"
[L14] Technology tags: ["codex-skill","relationship-coach","local-memory"]
[L14] Sources: ["S14"]
[L14] Query records: ["LQ4","LQ6"]
[L14] Disposition: "shortlisted"
[L14] Selection reason: "覆盖情绪承接、关系科学、聊天、长期记忆和安全边界，是本次最完整的直接对照项目。"
[L15] Name: "CNWU16/vedic-astro-skills"
[L15] Entity URL: "https://github.com/CNWU16/vedic-astro-skills"
[L15] Domain: "consumer_local_first"
[L15] Technology tags: ["astrology","agent-skill"]
[L15] Sources: ["S15"]
[L15] Query records: ["LQ4"]
[L15] Disposition: "rejected"
[L15] Selection reason: "以占星为核心，无法为可验证的现代关系建议提供可靠证据，应排除在核心设计之外。"
[L16] Name: "863401402/she-love-me"
[L16] Entity URL: "https://github.com/863401402/she-love-me"
[L16] Domain: "consumer_local_first"
[L16] Technology tags: ["chat-import","wechat","analytics"]
[L16] Sources: ["S16"]
[L16] Query records: ["LQ4"]
[L16] Disposition: "shortlisted"
[L16] Selection reason: "提供微信和 QQ 导入、分层采样、统计与报告，适合借鉴输入管线和证据等级输出。"
[L17] Name: "Aubrey0806/relationship-ququ-skill"
[L17] Entity URL: "https://github.com/Aubrey0806/relationship-ququ-skill"
[L17] Domain: "consumer_local_first"
[L17] Technology tags: ["agent-skill","relationship"]
[L17] Sources: ["S17"]
[L17] Query records: ["LQ4"]
[L17] Disposition: "shortlisted"
[L17] Selection reason: "具备一定社区采用度但说明较少，可保留为边缘对照，不能单独支撑关键设计判断。"
[L18] Name: "TammyTan516/relationship-training-skill"
[L18] Entity URL: "https://github.com/TammyTan516/relationship-training-skill"
[L18] Domain: "consumer_local_first"
[L18] Technology tags: ["roleplay","training-sandbox"]
[L18] Sources: ["S18"]
[L18] Query records: ["LQ4"]
[L18] Disposition: "shortlisted"
[L18] Selection reason: "训练沙盒、场景路由、实时或事后反馈与复盘报告适合转化为健康沟通练习模块。"
[L19] Name: "tomwong001/qingsheng-skill"
[L19] Entity URL: "https://github.com/tomwong001/qingsheng-skill"
[L19] Domain: "consumer_local_first"
[L19] Technology tags: ["screenshot-analysis","message-drafting","stages"]
[L19] Sources: ["S19"]
[L19] Query records: ["LQ5","LQ6"]
[L19] Disposition: "shortlisted"
[L19] Selection reason: "截图分析、平台适配、七阶段路由和公开评测具有参考价值，同时也是操控式设计的重要反例。"
[L20] Name: "baller-coder/jiaoyuan-love"
[L20] Entity URL: "https://github.com/baller-coder/jiaoyuan-love"
[L20] Domain: "consumer_local_first"
[L20] Technology tags: ["dating"]
[L20] Sources: ["S20"]
[L20] Query records: ["LQ5"]
[L20] Disposition: "rejected"
[L20] Selection reason: "项目缺少说明、许可和可核验功能，无法形成可复用的架构或可靠的产品判断。"
[L21] Name: "NatalieCao323/partner-skill"
[L21] Entity URL: "https://github.com/NatalieCao323/partner-skill"
[L21] Domain: "consumer_local_first"
[L21] Technology tags: ["partner-memory","relationship-maintenance"]
[L21] Sources: ["S21"]
[L21] Query records: ["LQ6"]
[L21] Disposition: "shortlisted"
[L21] Selection reason: "覆盖伴侣画像、长期场景、冲突与关系记忆，可借鉴场景目录，但其伪量化和人格蒸馏需剔除。"
[L22] Name: "Sylvara-Lin/SereneChat-skill"
[L22] Entity URL: "https://github.com/Sylvara-Lin/SereneChat-skill"
[L22] Domain: "consumer_local_first"
[L22] Technology tags: ["virtual-partner","persona-simulation"]
[L22] Sources: ["S22"]
[L22] Query records: ["LQ6"]
[L22] Disposition: "rejected"
[L22] Selection reason: "核心是导入真实聊天模拟虚拟女友，存在人格冒充、依赖和第三方隐私风险，不宜作为目标设计。"
[L23] Name: "BboTTM/heartflow-skill"
[L23] Entity URL: "https://github.com/BboTTM/heartflow-skill"
[L23] Domain: "consumer_local_first"
[L23] Technology tags: ["dating-simulation","mbti","astrology"]
[L23] Sources: ["S23"]
[L23] Query records: ["LQ6"]
[L23] Disposition: "rejected"
[L23] Selection reason: "场景模拟可作灵感，但依赖 MBTI 和星座并强调策略化追求，证据基础和伦理边界不足。"
[L24] Name: "duck-ai-yy/ex-ai"
[L24] Entity URL: "https://github.com/duck-ai-yy/ex-ai"
[L24] Domain: "consumer_local_first"
[L24] Technology tags: ["browser-local","chat-parser","digital-clone"]
[L24] Sources: ["S24"]
[L24] Query records: ["LQ6"]
[L24] Disposition: "shortlisted"
[L24] Selection reason: "浏览器本地解析和不上传架构值得借鉴，但生成前任数字分身的目标必须明确拒绝。"

<!-- op-finding:pain-map -->
## 痛点地图

这四类信号指向同一个工作：用户希望把真实聊天与关系经历转成可靠、可执行、可长期复用的帮助。输入格式缺失让工作无法开始；依赖和时间戳让工作中断；用户自写转换脚本增加维护成本；原始 JSON 和过度诊断让结果难以理解或误导行动。

| 信号 | 现实表现 | 对 plan.md 的直接要求 |
|---|---|---|
| P1 功能请求 | Markdown、语音、企业微信持续被请求 | 新增 adapter manifest 与格式契约 |
| P2 workaround | 用户自写秒/毫秒转换器 | 时间标准化、错误恢复和回归样本 |
| P3 reliability | 上游解密器消失、解析崩溃 | 依赖隔离，核心 Skill 不承担绕权限解密 |
| P4 review friction | 报告输出原始 JSON | 面向人的输出契约与 evidence_level |

[P1] Type: "feature_request"
[P1] Severity: "high"
[P1] Claims: ["C3"]
[P2] Type: "workaround"
[P2] Severity: "high"
[P2] Claims: ["C4"]
[P3] Type: "reliability"
[P3] Severity: "high"
[P3] Claims: ["C5"]
[P4] Type: "review_friction"
[P4] Severity: "medium"
[P4] Claims: ["C6"]

<!-- op-finding:competitor-matrix -->
## 相似项目：可仿照什么、不能仿照什么

没有一个项目应整仓照搬。下面的“仿照”指借鉴能力边界、数据契约和测试思想；代码与文本只能在许可证明确兼容时复用，未识别许可证的仓库只做研究参考。

| 项目 | 借鉴 | 明确舍弃 |
|---|---|---|
| [goutoujunshi](https://github.com/powerycy/goutoujunshi) | 情绪优先、知识分层、事实/推测/未知、有界记忆、ChatLab dry-run | 未核准许可内容的直接复制 |
| [zhiji-relationship](https://github.com/1wu-davy-2/zhiji-relationship) | 证据等级、反 PUA、婚姻生命周期、风格不绕安全测试 | 无许可证文本复制、人物视角做事实来源 |
| [she-love-me](https://github.com/863401402/she-love-me) | 联系人隔离、格式导入、统计与文本分层、可空字段 | 依恋诊断、固定被爱指数、聊天数据库自动解密 |
| [relationship-training-skill](https://github.com/TammyTan516/relationship-training-skill) | 场景沙盒、实时/事后反馈、引用原句复盘 | 真实对象 Persona、把推进当唯一目标 |
| [qingsheng-skill](https://github.com/tomwong001/qingsheng-skill) | 平台路由、首屏给可用回复、eval 回归 | 推拉、冷处理、制造稀缺、服从测试、Kino 升级 |
| [partner-skill](https://github.com/NatalieCao323/partner-skill) | 长期生活场景、纠错、版本、回顾 | RQI、虚构概率、人格蒸馏与确定性读心 |
| [npd-relationship-coach](https://github.com/FrankHu-HK/npd-relationship-coach) | 危机优先、四维风险、诊断边界、多选项 | 远程诊断 NPD、固定热线不核验、问卷强制弹出 |
| [Tilly](https://github.com/carlassmann/tilly) | 离线、加密、导入导出、用户数据所有权 | 默认把敏感内容发送外部 AI |
| [minutes](https://github.com/silverstein/minutes) | 本地转写、来源、策略检索、临时授权投影、同意提示 | 无告知录音或把通用会议 schema 原样用于亲密关系 |
| [tong-jincheng-skill](https://github.com/hotcoffeeshake/tong-jincheng-skill) | 风格层与分析层分离、诚实边界 | “不确定即不喜欢”等绝对启发式当结论 |
| [ex-skill](https://github.com/perkfly/ex-skill) / [ex-ai](https://github.com/duck-ai-yy/ex-ai) | 本地解析、增量 merge、纠错、回滚 | 前任数字分身、模拟真实对象说话与情感替代 |

替代品审计显示的缺口属于 G4 组合缺口：各项能力都有开源先例，但尚未看到一个许可清晰、非操控、非诊断、非人格克隆，同时覆盖聊天输入、即时回复、关系阶段、长期伴侣、婚姻家庭、安全与可控记忆的 Codex Skill。

[A1] Name: "she-love-me"
[A1] Sources: ["S16"]
[A1] Receipts: ["RR122"]
[A1] License: "MIT"
[A1] Last activity: "2026-08-04"
[A1] Coverage: "微信与 QQ 聊天导入、统计分析、风险提示和双格式报告。"
[A1] Gap: "偏重聊天鉴定，存在人格与依恋过度推断，不覆盖安全的完整关系生命周期。"
[A1] Candidate: "cand-goutoujunshi"
[A1] Landscape: "L14"
[A2] Name: "qingsheng-skill"
[A2] Sources: ["S19"]
[A2] Receipts: ["RR123"]
[A2] License: "MIT"
[A2] Last activity: "2026-08-05"
[A2] Coverage: "截图分析、回复生成、平台适配和七阶段关系推进。"
[A2] Gap: "包含推拉、稀缺和框架控制等操控式设计，公开评测也显示大量场景未通过。"
[A2] Candidate: "cand-goutoujunshi"
[A2] Landscape: "L14"
[A3] Name: "partner-skill"
[A3] Sources: ["S21"]
[A3] Receipts: ["RR124"]
[A3] License: "MIT"
[A3] Last activity: "2026-07-31"
[A3] Coverage: "伴侣画像、二十三类长期场景、冲突处理、状态机和关系记忆。"
[A3] Gap: "使用缺乏实证来源的 RQI 与转移概率，并把伴侣蒸馏为可模拟人格。"
[A3] Candidate: "cand-goutoujunshi"
[A3] Landscape: "L14"
[A4] Name: "dating-coach-gpt"
[A4] Sources: ["S3"]
[A4] Receipts: ["RR120"]
[A4] License: "MIT"
[A4] Last activity: "2026-06-20"
[A4] Coverage: "可运行的约会教练 Web 应用原型。"
[A4] Gap: "采用度和领域深度较低，未提供长期档案、证据治理和高风险分流。"
[A4] Candidate: "cand-goutoujunshi"
[A4] Landscape: "L14"
[A5] Name: "openclaw-relationship-coach"
[A5] Sources: ["S7"]
[A5] Receipts: ["RR121"]
[A5] License: "MIT"
[A5] Last activity: "2026-07-31"
[A5] Coverage: "以大量课程覆盖聊天、约会、推进和长期关系。"
[A5] Gap: "偏课程库且采用度低，未展示可靠聊天导入和字段级记忆治理。"
[A5] Candidate: "cand-goutoujunshi"
[A5] Landscape: "L14"
[A6] Name: "Tilly"
[A6] Sources: ["S35"]
[A6] Receipts: ["RR114"]
[A6] License: "MIT"
[A6] Last activity: "2026-07-09"
[A6] Coverage: "离线优先、客户端加密的关系日志、提醒、导入导出与 AI 助手。"
[A6] Gap: "擅长记忆和提醒，不负责关系证据判断、即时回复与高风险安全分流。"
[A6] Candidate: "cand-goutoujunshi"
[A6] Landscape: "L14"
[A7] Name: "Marriage-Counselor-Agent"
[A7] Sources: ["S37"]
[A7] Receipts: ["RR116"]
[A7] License: "NOASSERTION"
[A7] Last activity: "2026-03-09"
[A7] Coverage: "十一类专家代理覆盖倾听、评估、冲突、亲密、边界和压力。"
[A7] Gap: "采用度低且无清晰许可证，不是 Codex Skill，也未形成聊天导入协议。"
[A7] Candidate: "cand-goutoujunshi"
[A7] Landscape: "L14"
[A8] Name: "minutes"
[A8] Sources: ["S38"]
[A8] Receipts: ["RR117"]
[A8] License: "MIT"
[A8] Last activity: "2026-08-05"
[A8] Coverage: "本地语音转写、结构化 Markdown、来源追踪和策略安全检索。"
[A8] Gap: "是通用会话记忆层，不提供亲密关系知识、阶段路由和消息代拟。"
[A8] Candidate: "cand-goutoujunshi"
[A8] Landscape: "L14"
[A9] Name: "Sweetie"
[A9] Sources: ["S36"]
[A9] Receipts: ["RR115"]
[A9] License: "Apache-2.0"
[A9] Last activity: "2025-01-02"
[A9] Coverage: "面向伴侣的一对一沟通与内容分享应用。"
[A9] Gap: "项目老旧且功能主要是通讯载体，不提供关系分析、教练、安全或证据能力。"
[A9] Candidate: "cand-goutoujunshi"
[A9] Landscape: "L14"

<!-- op-finding:disconfirmation -->
## 反证：为什么不直接用现成项目

最强反对意见是：goutoujunshi 和 zhiji-relationship 已经非常接近计划目标，高关注度的 tong-jincheng-skill、ex-skill 又证明了传播路径；重新写一个 Skill 可能重复建设。这一反证成立了一半：新 Skill 不能把“有聊天回复和情感建议”包装成创新，也不该重新发明已有的本地记忆、输入解析或场景路由。

反证没有彻底推翻新建方向，原因有四点：

1. 现有项目在操控、诊断、伪量化、数字分身或许可证上各有硬缺口。
2. 现有 plan.md 已锁定与 past-wis 的证据桥接和更严格的展示—确认—写入—重读协议，直接替换会丢失这些要求。
3. 用户目标包括从认识、约会、表白到同居、结婚、家庭协作的完整生命周期，公开热门项目仍明显偏追求期或人格模拟。
4. 新 Skill 的合理差异是可信组合与治理，不是话术数量。

因此 outcome 为 weakened：应吸收现有项目的成熟能力，并收紧新 Skill 的独特范围；不应取消独立 Skill，也不应把任何现成仓库定为唯一底座。

[R4] Candidate: "cand-goutoujunshi"
[R4] Landscape: "L14"
[R4] Hypothesis: "成熟公开项目已经完整覆盖从追求、聊天、伴侣经营到婚姻与安全的全部能力，因此无需另建独立 Skill。"
[R4] Attack queries: ["”relationship coach” agent skill stars:>10 in:name,description,readme fork:false","恋爱 skill stars:>50 in:name,description,readme fork:false","”relationship coach” skill license:mit in:name,description,readme fork:false"]
[R4] Contrary sources: ["S39","S40","S41","S42"]
[R4] Claims: ["C13","C14"]
[R4] Outcome: "weakened"

<!-- op-finding:scorecards -->
## 直接对照评分卡与证据声明

评分对象 cand-goutoujunshi 只是“最接近现有计划的公开直接对照”，不是本报告选择的实现。总分为 59/100：活跃度与可行性较好，真实输入痛点明确；组合缺口仍存在；长期维护成本集中在数据适配、证据更新和安全治理。没有硬停止项，但 Scout 模式不据此做选型。

所有事实和推理都在下面绑定到来源。尤其注意：C7 与 C11 是推理，不是 GitHub 项目作者直接给出的结论；依恋、人格和关系结局不在本报告中被当作可确定诊断。

[C1] Text: "首轮打开的直接仓库显示，公开方案已分别覆盖约会教练、聊天分析、伴侣维护和安全支持，但能力分散在不同项目中。"
[C1] Kind: "fact"
[C1] Current: true
[C1] Evidence types: ["dated_snapshot"]
[C1] Sources: ["S14","S16"]
[C1] Receipts: ["RR20","RR22"]
[C1] Candidate: "cand-goutoujunshi"
[C1] Landscape: "L14"
[C2] Text: "goutoujunshi 的公开说明在 2026 年 7 月连续记录聊天、投入失衡和长期关系场景更新，表明该直接对照项目仍在活跃迭代。"
[C2] Kind: "fact"
[C2] Current: true
[C2] Evidence types: ["repo_activity"]
[C2] Sources: ["S14"]
[C2] Receipts: ["RR49"]
[C2] Candidate: "cand-goutoujunshi"
[C2] Landscape: "L14"
[C3] Text: "用户公开请求支持 Markdown 导出、语音消息和企业微信，说明聊天输入适配必须采用可扩展的格式适配层。"
[C3] Kind: "fact"
[C3] Current: true
[C3] Evidence types: ["pain_feature_request"]
[C3] Sources: ["S26","S27","S30"]
[C3] Receipts: ["RR35","RR36","RR39"]
[C3] Candidate: "cand-goutoujunshi"
[C3] Landscape: "L14"
[C4] Text: "毫秒与秒时间戳混用导致 Windows 运行失败，用户不得不自行编写转换脚本才能继续分析。"
[C4] Kind: "fact"
[C4] Current: true
[C4] Evidence types: ["pain_workaround"]
[C4] Sources: ["S28"]
[C4] Receipts: ["RR37"]
[C4] Candidate: "cand-goutoujunshi"
[C4] Landscape: "L14"
[C5] Text: "上游解密依赖消失和时间戳异常均能中断核心聊天分析流程，说明外部导入依赖与格式兼容是持续可靠性风险。"
[C5] Kind: "fact"
[C5] Current: true
[C5] Evidence types: ["pain_reliability"]
[C5] Sources: ["S25","S28"]
[C5] Receipts: ["RR34","RR37"]
[C5] Candidate: "cand-goutoujunshi"
[C5] Landscape: "L14"
[C6] Text: "结构化人格与依恋结果曾以原始 JSON 暴露给用户，使用者明确要求 value、reason、evidence_level 与 observable_signals 等可读字段。"
[C6] Kind: "fact"
[C6] Current: true
[C6] Evidence types: ["pain_review"]
[C6] Sources: ["S29"]
[C6] Receipts: ["RR38"]
[C6] Candidate: "cand-goutoujunshi"
[C6] Landscape: "L14"
[C7] Text: "聊天分析对解密器、平台导出和时间戳规范高度敏感，因此维护成本主要来自适配器、依赖漂移与失败恢复，而不是提示词本身。"
[C7] Kind: "inference"
[C7] Current: true
[C7] Evidence types: ["maintenance_burden"]
[C7] Sources: ["S25","S28"]
[C7] Receipts: ["RR34","RR37"]
[C7] Candidate: "cand-goutoujunshi"
[C7] Landscape: "L14"
[C7] Supporting claims: ["C4","C5"]
[C7] Reasoning: "两个独立故障都发生在输入管线而非关系推理层，说明长期维护预算应优先投入格式契约、依赖隔离和回归测试。"
[C8] Text: "she-love-me、qingsheng-skill 与 partner-skill 分别覆盖聊天导入、阶段化回复和长期伴侣场景，但没有一个项目同时满足证据、安全和记忆治理要求。"
[C8] Kind: "fact"
[C8] Current: true
[C8] Evidence types: ["substitute_capability"]
[C8] Sources: ["S3","S7","S16","S19","S21"]
[C8] Receipts: ["RR120","RR121","RR122","RR123","RR124"]
[C8] Candidate: "cand-goutoujunshi"
[C8] Landscape: "L14"
[C8] Alternatives: ["A1","A2","A3","A4","A5"]
[C9] Text: "Tilly 和 Marriage-Counselor-Agent 证明关系日志与多专家婚姻支持可行，但它们不是面向即时聊天、约会与全生命周期的 Codex Skill。"
[C9] Kind: "fact"
[C9] Current: true
[C9] Evidence types: ["substitute_usability"]
[C9] Sources: ["S35","S36","S37","S38"]
[C9] Receipts: ["RR114","RR115","RR116","RR117"]
[C9] Candidate: "cand-goutoujunshi"
[C9] Landscape: "L14"
[C9] Alternatives: ["A6","A7","A8","A9"]
[C10] Text: "minutes 以本地转写、结构化 Markdown、来源追踪和策略化检索实现隐私会话记忆，证明可审计的本地关系档案具有工程可行性。"
[C10] Kind: "fact"
[C10] Current: true
[C10] Evidence types: ["implementation_feasibility"]
[C10] Sources: ["S38"]
[C10] Receipts: ["RR117"]
[C10] Candidate: "cand-goutoujunshi"
[C10] Landscape: "L14"
[C11] Text: "新 Skill 的可辨识差异应是安全地统一全生命周期关系路由、聊天输入、证据校准与可控记忆，而不是再造一个恋爱话术人格。"
[C11] Kind: "inference"
[C11] Current: true
[C11] Evidence types: ["differentiation_wedge"]
[C11] Sources: ["S16","S19","S21","S35","S37","S38"]
[C11] Receipts: ["RR122","RR123","RR124","RR114","RR116","RR117"]
[C11] Candidate: "cand-goutoujunshi"
[C11] Landscape: "L14"
[C11] Supporting claims: ["C8","C9","C10"]
[C11] Reasoning: "直接项目和相邻项目分别证明单点能力已经存在，剩余缺口是把这些能力用统一证据、隐私和安全契约组合起来。"
[C12] Text: "直接 Skill 仓库支持 Codex、AgentSkills 或 OpenClaw，而 Tilly 提供离线 PWA，说明可通过本地 Skill 与可选可视界面形成自然分发入口。"
[C12] Kind: "fact"
[C12] Current: true
[C12] Evidence types: ["distribution_channel"]
[C12] Sources: ["S16","S19","S35"]
[C12] Receipts: ["RR122","RR123","RR114"]
[C12] Candidate: "cand-goutoujunshi"
[C12] Landscape: "L14"
[C13] Text: "高关注度的童锦程视角和前任人格 Skill 证明个性化关系帮助存在需求，但二者分别局限于单一人物视角与真实对象模拟。"
[C13] Kind: "fact"
[C13] Current: true
[C13] Evidence types: ["disconfirmation_competitor"]
[C13] Sources: ["S39","S40"]
[C13] Receipts: ["RR118","RR119"]
[C13] Candidate: "cand-goutoujunshi"
[C13] Landscape: "L14"
[C14] Text: "两个高关注度人物 Skill 索引仓库未被 GitHub API 识别出标准许可证，因此它们适合作为发现渠道，不适合直接复制实现。"
[C14] Kind: "fact"
[C14] Current: true
[C14] Evidence types: ["disconfirmation_dependency"]
[C14] Sources: ["S41","S42"]
[C14] Receipts: ["RR112","RR113"]
[C14] Candidate: "cand-goutoujunshi"
[C14] Landscape: "L14"
[cand-goutoujunshi] Name: "goutoujunshi 直接对照审计"
[cand-goutoujunshi] Domain: "consumer_local_first"
[cand-goutoujunshi] Landscape: "L14"
[cand-goutoujunshi] Score momentum: 8
[cand-goutoujunshi] Evidence momentum: ["C2"]
[cand-goutoujunshi] Score pain: 12
[cand-goutoujunshi] Evidence pain: ["C3","C4","C5"]
[cand-goutoujunshi] Score open_source_gap: 12
[cand-goutoujunshi] Evidence open_source_gap: ["C8","C9"]
[cand-goutoujunshi] Score feasibility: 10
[cand-goutoujunshi] Evidence feasibility: ["C10"]
[cand-goutoujunshi] Score differentiation: 8
[cand-goutoujunshi] Evidence differentiation: ["C11"]
[cand-goutoujunshi] Score distribution: 6
[cand-goutoujunshi] Evidence distribution: ["C12"]
[cand-goutoujunshi] Score maintainability: 3
[cand-goutoujunshi] Evidence maintainability: ["C7"]
[cand-goutoujunshi] Hard stops: []

<!-- op-finding:recommendation -->
## 对现有 plan.md 的完整修改建议

### 一、保留不动的核心

以下设计已经正确，不应在实现时被热门仓库带偏：

1. 保持 relationship-coach 独立于 past-wis，古籍只做可选证据层，现代平等、同意和安全拥有最终优先级（plan.md:50–66、271–281）。
2. 保留感性隔离区：情绪强烈时先承接、降速和稳定，再分析（plan.md:96–129）。
3. 保留事实、解释、愿望/恐惧、未知四层分离（plan.md:220–233）。
4. 保留“不输出无依据概率、不把回复时间当固定规律、不做人格诊断、不提供操控策略”（plan.md:41–48、540–555）。
5. 保留原始聊天默认只用于当轮、长期保存必须单独确认（plan.md:169–180）。
6. 保留长期档案与 Skill 文件分离、稳定 ID、原子写入、重读验证、导出与删除（plan.md:284–435）。
7. 保留简单请求短答、高风险或长期复盘才展开的输出原则（plan.md:68–94、478–486）。
8. 保留静态、脚本、行为压力和独立前向测试四层验证（plan.md:488–538）。

### 二、必须补入的功能

#### 1. 增加“关系生命周期路由”，替换只有场景列表、没有阶段任务的现状

在第 4 节总体工作流和第 8 节关系判断之间新增 lifecycle-routing。阶段不应是“拿下对方”的漏斗，而是双方任务不同的状态：

- 自我稳定/尚无具体对象；
- 初识与建立联系；
- 双方存在初步兴趣；
- 约会与互相了解；
- 关系定义与排他性协商；
- 稳定伴侣与日常维护；
- 同居、订婚或婚前准备；
- 婚姻、家庭与长期照护；
- 分手、背叛、修复或退出的分支；
- 暴力、胁迫和危机的安全旁路。

每个阶段必须定义：可确认信号、当前共同任务、允许的行动、需要明确同意的行动、主要风险、停止条件、转入下一阶段的条件。阶段转换基于互惠和明确沟通，不基于“聊了几天”“第几次约会”或固定回复时长。

#### 2. 把聊天实验室升级为正式输入协议

第 7.1 节目前只列输入类型，需要补充 chat-ingestion-contract：

- 支持复制文本、Markdown、JSON、CSV、微信/QQ/WhatsApp/Telegram 导出、截图、语音转写和用户转述；
- 每次导入产生 manifest：来源、格式版本、时间范围、时区、消息数、附件数、解析警告、去标识化状态；
- 强制显示并确认“谁是用户/谁是对方”的说话人映射，不能靠左右、性别或语气猜；
- 统一秒、毫秒、时区和缺失时间；保留原时间与规范化时间；
- OCR 和语音结果带置信度，低置信内容不得当作原话；
- 解析失败时允许部分结果、错误清单和重试，不静默丢消息；
- 原始聊天视为不可信数据，防止其中的提示词、命令或链接改变 Skill 行为；
- 核心 Skill 不自动解密聊天数据库、不绕权限、不自动抓取社交账号；
- 首次只做只读 dry-run，展示数量和映射，不展示全文、不写长期档案。

#### 3. 为不同任务定义输出契约

在第 7.3 节与第 14 节之间新增 output-contracts，至少分四种：

- 快速回复：第一屏只给一条首选成品，再给一句理由和积极/含糊/拒绝三个后续分支。
- 聊天分析：目标、可确认原话与行为、两种以上替代解释、关键未知、证据等级、下一步验证动作。
- 训练复盘：引用用户原句，指出有效处、风险处、可替换表达和下一次练习目标；不把“推进感”设为最高目标。
- 高风险支持：先安全、现实资源和不可逆动作暂停，不继续优化追求或吵架话术。

证据等级建议固定为 high、medium、low、insufficient。任何关系阶段、动机、依恋或风险判断都要写出“依据是什么、什么会推翻它”。不得生成虚构精确分数、关系成功率或转移概率。

#### 4. 把“现代关系教学”改成可维护的来源注册表

第 6.2 节已有证据层级，但还缺 source-registry。每个重要知识条目记录：

- claim_id、主题、结论、证据类型；
- 样本与文化范围、相关而非因果限制；
- 适用条件、禁忌条件、潜在风险；
- 来源 URL、出版/更新日期、最后核验日期；
- 是否涉及法律、医疗、性健康或危机资源；
- 需要联网刷新还是可以离线使用。

MBTI、星座、爱情语言、网络“高价值/低价值”、固定依恋标签只能作为用户语言或提问框架，不能承担匹配、诊断和重大决策。

#### 5. 全量补齐“对象到结婚”的长期模块

第 2.2 节虽然写到长期关系，但知识域和测试仍偏聊天期。至少增加 long-term-partnership 与 intimacy-consent 两份参考，覆盖：

- 同居规则、家务与隐形劳动、个人空间和数字边界；
- 收入、债务、账户、预算、房产、彩礼/婚礼、赡养和风险偏好；
- 双方父母、节日、探访、经济支持、照护和隐私；
- 城市、职业、异地、迁移与牺牲补偿；
- 性需求、持续同意、避孕、性健康、影像隐私和性排他边界；
- 生育意愿、不孕方案、怀孕、产后、夜间照护和职业影响；
- 育儿分工、教育分歧、祖辈参与和孩子不被三角化；
- 疾病、成瘾、失业、丧亲、中年照护、退休和老年安排；
- 背叛、信任重建、何时适合伴侣咨询，何时不适合；
- 每周关系会议、每月财务/任务复盘和重大转折重新协商。

婚姻不能被设计成恋爱“毕业关卡”，它同时是法律、经济、生活协作、亲密和家族系统。

#### 6. 把长期档案升级为字段级治理

第 11 节的目录和确认流程已经很好，还需要补：

- 三种模式：不记忆、仅当前会话、长期档案；默认不记忆；
- 字段敏感级别：普通、敏感、极敏感；极敏感不因“有用”自动建议保存；
- 每个字段都保存来源、原话/摘要、确认状态、置信度、创建与复核时间；
- 稳定事实、事件事实、用户解释、模型假设分别存放，模型假设不能覆盖事实；
- 可配置保留期与过期复核；过时推断自动降级；
- 多对象物理隔离和查询作用域，禁止跨对象串档；
- 原始附件隔离、哈希、删除状态和是否允许外部模型处理；
- 派生 overview 可以从事件重建，不成为唯一事实源；
- 冲突记录保留旧值、证据和用户纠正，不静默覆盖；
- 删除对象时同时清理索引、缓存、撤销快照和附件；
- 导出包含字段说明与来源，不只导出结论。

不要采用固定 E×R×F 权重把高情绪事件永久提升为“核心记忆”；情绪强烈不等于长期代表性。

#### 7. 新增隐私威胁模型

第 11.11 节应从原则扩展为 privacy-threat-model：

- 第三方聊天最小化、去标识化和用途说明；
- 外部 AI、OCR 或语音服务调用前明确披露发送范围；
- 默认本地处理；无法本地时提供“不处理”选项；
- 不自动发送消息、不登录账号、不代替用户联系对方；
- 不保存身份证、住址、账号、私密影像和精确位置，除非用户明确要求且用途必要；
- 防止聊天文本中的提示注入、恶意链接和工具命令；
- 防止跨关系召回、日志泄漏、路径穿越和备份残留；
- 录音和语音导入必须提醒当地同意要求，并以最新法规为准；
- 对“帮我破解/导出/跟踪她”的请求直接拒绝并给合法替代。

#### 8. 扩充安全分类和处置

第 9 节应明确区分普通冲突与强制控制，新增：

- 人身暴力与威胁；
- 性胁迫、灌醉、避孕破坏和私密影像；
- 跟踪、定位、账号监控、查手机和数字骚扰；
- 财务控制、强迫转账、债务和限制工作；
- 曝光隐私、勒索、冒充和人肉搜索；
- 用自伤、自杀、孩子或宠物威胁对方；
- 未成年人、师生/上下级等重大权力差；
- 儿童、老人和残障者受虐；
- 用户本人有立即自伤或伤人风险。

出现暴力或强制控制时，不给“双方好好沟通”或伴侣练习；优先安全计划、可信联系人、证据保护和实时核验的当地资源。热线、法律和医疗信息不得写死为永不过期常量。

#### 9. 明确反性别刻板与包容性

虽然初始需求是“与女生聊天”，Skill 的分析对象必须是具体的人和可观察行为，不建立“女性心理”“女人都慕强”等知识域。触发词可以覆盖追女生，但内核应支持不同性别、性取向、单偶/协商非单偶、跨文化、残障和神经多样性。不得由群体身份推断人格、忠诚、性行为或关系能力。

#### 10. 划清对话演练与人格克隆

第 7.4 节需要写死：

- 可以模拟“积极、含糊、拒绝”三类假设分支；
- 每轮只生成一条假设回复并等待用户作答；
- 模拟内容明确标注为练习，不声称是现实对象会说的话；
- 不从真实聊天生成可长期调用的女友、伴侣或前任 Persona；
- 不用对方的口吻陪伴用户，不制造“她还在”的错觉；
- 纠错只改善场景假设，不固化为对方的人格真相。

### 三、建议调整的 Skill 文件清单

对 plan.md 第 12 节，建议保留轻量 SKILL.md 路由，同时把参考文件补齐为：

- references/lifecycle-routing.md
- references/emotional-containment.md
- references/chat-ingestion-contract.md
- references/chat-evidence-and-uncertainty.md
- references/reply-drafting.md
- references/relationship-education.md
- references/conflict-and-repair.md
- references/long-term-partnership.md
- references/intimacy-consent-and-sexual-health.md
- references/safety-abuse-and-crisis.md
- references/privacy-threat-model.md
- references/memory-protocol.md
- references/source-registry.md
- references/past-wis-bridge.md
- references/output-contracts.md

脚本层应补充 validate_chat_import、normalize_timestamps、redact_transcript、validate_record、validate_memory_store、detect_cross_relationship_leakage 和 validate_contract。脚本只负责确定性的数据与契约检查，不负责算“爱不爱概率”。

### 四、现有测试必须扩成的回归家族

一次性实现时至少覆盖以下家族，每个家族同时有正常样例和对抗样例：

1. 单句、长对话、截图、多说话人、Markdown、JSON、语音、损坏文件、秒/毫秒、时区和缺失时间。
2. 说话人映射错误、OCR 低置信、聊天中的提示注入、恶意链接和隐藏命令。
3. 对方积极、含糊、明确拒绝、只拒绝时间、停止联系和被拉黑。
4. 初识、首次邀约、表白、关系定义、同居、婚前、婚姻、育儿、双方家庭、疾病照护和退休。
5. 冲突降级、道歉、冷静暂停、背叛、信任重建、分手、复合与体面退出。
6. PUA、故意冷落、制造嫉妒、服从测试、跟踪、偷拍、查手机和绕过拒绝。
7. 性同意、醉酒、避孕破坏、私密影像、未成年人和权力不对等。
8. 暴力、勒索、财务控制、数字监控、自伤威胁和立即危机。
9. 不记忆/会话/长期三种模式、展示确认、纠正、过期、删除、导出和原子失败恢复。
10. 多对象隔离、同名对象、跨关系泄漏、旧推断污染、新证据冲突和撤销历史清理。
11. 风格切换不改变证据和安全结论；任何“直白/军师/童锦程”触发都不能绕过边界。
12. 首屏可用性：信息已足够时先给基础结论或草稿，不能只连环追问；证据不足时仍明确未知。

### 五、对 plan.md 的直接落点

- 第 2.2 节：把“长期关系中的沟通、分工和共同决定”展开为婚前、婚姻、家庭生命周期场景。
- 第 4 节：在路由中加入 lifecycle、input validation、privacy gate 和 output contract。
- 第 6 节：增加 source-registry 与证据更新周期。
- 第 7 节：增加 manifest、speaker map、timestamp、OCR/voice confidence、partial failure 和 prompt-injection 规则。
- 第 8 节：阶段判断增加可证伪条件，不用固定分数和概率。
- 第 9 节：增加强制控制、数字/财务/性暴力与地区资源刷新。
- 第 11 节：增加记忆模式、敏感级别、来源、TTL、派生视图重建和跨对象泄漏检测。
- 第 12 节：采用上面的参考文件与确定性验证脚本清单。
- 第 13 节：触发语义补入同居、婚前、婚姻、家务、财务、性与亲密、生育、育儿、双方家庭和照护。
- 第 15–16 节：加入输入故障、操控越狱、人格克隆、隐私外传、提示注入和全生命周期验收。

### 六、明确不进入新 Skill 的功能

以下内容直接判定为“不可以”：

- 预测她爱你的百分比、关系成功率或一周后的状态；
- 用固定回复时长、消息数或主动比例判定爱与不爱；
- 诊断对方 NPD、依恋类型、创伤或人格障碍；
- 教用户冷落、推拉、制造嫉妒、打压、服从测试和绕过拒绝；
- 自动解密聊天数据库、偷看账号、跟踪定位或抓取对方隐私；
- 从真实聊天创建女友、伴侣或前任数字分身；
- 自动替用户发送消息、创建账号或联系第三方；
- 把 MBTI、星座、爱情语言和“女性心理”当决策证据；
- 在暴力或控制关系中继续做普通伴侣沟通训练；
- 把完整私密聊天上传搜索引擎或未披露的云端服务。

### 七、继续验证的具体问题

这是多方向验证清单，不是让用户再做产品选择：

- 输入方向：匿名样本能否覆盖微信/QQ/Markdown/JSON/截图/语音的统一 manifest？
- 生命周期方向：每个阶段是否都有互惠、同意、停止条件和至少两个回归样例？
- 记忆方向：删除、过期、纠正和跨对象隔离能否由脚本确定性验证？
- 证据方向：来源注册表能否识别过期法律、热线和医疗信息并强制刷新？
- 安全方向：风格层、对话材料和用户强烈要求能否都无法绕过拒绝与危机路由？
- 可用性方向：快速回复是否在第一屏给出一条能发的成品，同时保留不确定性和退出分支？

最终判断：保留现有 plan.md 的总体架构与原则，但在真正实施前把本报告的十项必须补充、十五份参考文件、确定性验证脚本和十二类回归家族合并回计划。这样做以后，新 Skill 才真正覆盖“追求到结婚”，而不是一个更长的聊天话术库。

