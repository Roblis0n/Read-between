# Read Between — Relationship Clarity & Action

> Read between the lines. Know what's next.

English · [中文](README.md)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Version](https://img.shields.io/badge/version-v1.0-blue.svg)](CHANGELOG-v1.md)

A Claude Code / Codex Skill covering the full relationship lifecycle. Helps you do three things at once: **feel held, see clearly, take the next step**.

No mind-reading. No success-rate predictions. No manipulation tactics.

## Capabilities

| Capability | Description |
|------------|-------------|
| 🧭 Pursue-or-not decision | Structured 5-step framework: signal inventory → self-clarification → cost assessment → reversibility design → decision |
| 🗺️ Pursuit strategy | 4-phase roadmap: presence → connection → invitation → progression & confession |
| 🔍 Chat evidence analysis | 8-dimension analysis: literal content / behavior / context / pragmatics / alternative explanations / information gaps / verifiable signals / risk |
| ✍️ Message drafting | Invitations, confessions, apologies, daily chat, boundary-setting — delivers one ready-to-send version by default |
| 🎭 Dialogue rehearsal | Hypothetical branching with post-rehearsal feedback (does not clone real personalities) |
| 🫂 Emotional support | Reflect → separate → allow contradiction → stabilizing action → judge exit timing |
| 🔧 Conflict & repair | De-escalation → responsibility differentiation → 4-element apology → repair actions |
| 📚 Relationship education | Attachment, boundaries, consent, trust, communication, jealousy — modern relationship knowledge |
| 🏠 Long-term partnership & marriage | Cohabitation, marriage, division of labor, joint decisions — summary-level support |
| 🔮 Zodiac / BaZi / MBTI | Available on request as reference frameworks — symbolic lenses, not predictions or verdicts |
| 📜 Classical reference | Built-in classical corpus — 10 source texts including *Shijing*, *Shishuo Xinyu*, *Caigentan*; agent-driven retrieval and interpretation; five voice styles adaptively matched; extended thinking + web search for modern reference |
| 🛡️ Safety triage | Violence, coercion, self-harm, stalking, intimate image threats, minors, power imbalance — overrides all ordinary relationship advice |

### What Read Between Won't Do

- Won't estimate percentage chances of romantic success
- Won't diagnose personality disorders (NPD, attachment styles, etc.)
- Won't teach PUA tactics, push-pull, jealousy games, silent treatment, or personality cloning
- Won't auto-save chat logs
- Won't make the final decision for you

## Quick Start

Place this directory into your skills directory. The skill activates automatically via keyword matching — triggered when the user discusses dating, relationships, pursuit, chat analysis, message drafting, and related topics.

Run static validation to verify file integrity:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/validate_contract.ps1
```

## Directory Structure

```
read-between/
├── SKILL.md                    # Core router, non-negotiable rules, workflows
├── ARCHITECTURE.md             # Architecture doc (runtime logic, design principles, divergence analysis)
├── CHANGELOG-v1.md             # v1 iteration changelog
├── README.md                   # 中文文档
├── README.en.md                # English documentation (this file)
├── LICENSE                     # MIT
├── .gitignore
├── agents/
│   └── openai.yaml             # Interface metadata
├── references/                 # 24 on-demand reference files (incl. classical layer)
│   ├── intent-insight.md           # Intent recognition & genuine need insight
│   ├── pursue-or-not.md            # 5-step pursue-or-not decision framework
│   ├── pursuit-strategy.md         # 4-phase pursuit roadmap
│   ├── early-dating.md             # Early dating & relationship formation
│   ├── chat-ingestion-contract.md  # Chat import protocol
│   ├── chat-evidence-and-uncertainty.md  # Chat evidence analysis framework
│   ├── reply-drafting.md           # Message drafting
│   ├── dialogue-practice.md        # Dialogue rehearsal
│   ├── emotional-containment.md    # Emotional support & stabilization
│   ├── relationship-education.md   # Modern relationship knowledge
│   ├── conflict-and-repair.md      # Conflict & repair
│   ├── partnership-marriage-overview.md  # Long-term partnership & marriage overview
│   ├── safety-abuse-and-crisis.md  # Safety, abuse & crisis triage
│   ├── privacy-threat-model.md     # Privacy threat model
│   ├── memory-protocol.md          # Session memory & user-controlled archiving
│   ├── personality-insight-layer.md # Zodiac / BaZi / MBTI reference perspectives
│   ├── classical-interpretation.md  # Classical interpretation rules & scene routing
│   ├── classical-voices.md         # Five classical voice styles
│   ├── classical-catalog.md        # Classical corpus navigation catalog
│   ├── classical-corpus/           # 10 full classical source texts
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
│   ├── source-registry.md          # Knowledge source registry
│   ├── lifecycle-routing.md        # Full-lifecycle state machine
│   ├── output-contracts.md         # Output format contracts
│   └── data-root.txt               # Data directory path
└── scripts/                    # 8 PowerShell validation tools
    ├── validate_contract.ps1        # Static contract validation (file existence + cross-reference integrity)
    ├── validate_chat_import.ps1     # Chat import format validation
    ├── normalize_timestamps.ps1     # Timestamp normalization
    ├── redact_transcript.ps1        # Chat transcript de-identification
    ├── validate_record.ps1          # Memory record format validation
    ├── validate_memory_store.ps1    # Memory store integrity check
    └── detect_cross_relationship_leakage.ps1  # Cross-relationship information leakage detection
```

## Validation Tools

Eight PowerShell scripts covering the full pipeline from format checking to privacy protection:

| Script | Purpose | When to Run |
|--------|---------|-------------|
| `validate_contract.ps1` | Verify all files exist, cross-references intact, no orphan files | First install, after upgrades |
| `validate_chat_import.ps1` | Validate imported chat record formatting | Before importing chats |
| `normalize_timestamps.ps1` | Normalize chat timestamps to standard format | Before importing chats |
| `redact_transcript.ps1` | Strip real names and identifying info from transcripts | Before sharing or archiving |
| `validate_record.ps1` | Validate memory record field completeness and format | After writing memories |
| `validate_memory_store.ps1` | Check memory directory structure integrity | First use, after data directory changes |
| `detect_cross_relationship_leakage.ps1` | Detect person-info leakage across relationship profiles | When maintaining multiple relationship archives |
| `search_classics.ps1` | Cross-search classical source texts by keyword, return hit locations and context | When classical reference is needed |

## Further Reading

- **[ARCHITECTURE.md](ARCHITECTURE.md)** — Runtime logic flowchart, design principles, 3-tier insight architecture, divergence from original plan, competitive differentiation
- **[CHANGELOG-v1.md](CHANGELOG-v1.md)** — Batch-by-batch v1 iteration details, before/after comparisons, verification checklist
- **[SKILL.md](SKILL.md)** — Core router, non-negotiable rules, workflow, quick routing table
- **[README.md](README.md)** — 中文完整文档

## Roadmap

The following are not committed in the skill description but are natural extension directions:

- [ ] Long-distance relationship strategy (standalone module)
- [ ] Breakup recovery & reconciliation assessment (standalone module)
- [ ] More comprehensive gender and relationship-structure neutrality

## Disclaimer

Read Between is an AI skill instruction file. It is **not** psychotherapy, psychiatric diagnosis, legal advice, or a crisis hotline. If you are in immediate physical danger, call your local emergency number.
