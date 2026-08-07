# Classical Corpus -- 古典语料原文库

## 文本来源

本目录下10部古典文本原文来自**殆知阁**（daizhige.org）开放语料库，通过 GitHub 仓库 [frankslin/daizhigev20](https://github.com/frankslin/daizhigev20) 获取。

## 清理规则

| 文本 | 清理操作 |
|------|---------|
| 诗经 | 删除前328行目录（TOC），仅保留正文诗篇，每首诗保留标题行 |
| 其他9部 | 直接使用，无需额外清理 |

所有文件保留原始 YAML frontmatter（标题、作者、分类、来源链接等），以供引用时参考出处和归属。

## 许可说明

原始古籍文本已进入公共领域（public domain）。殆知阁数字化整理版本以开放许可发布，具体见 [daizhigev20 仓库](https://github.com/frankslin/daizhigev20)。

## 使用规范

**本目录下的文件仅供 agent 检索和精读使用。**

- **严禁全量读取**：10部文本合计超过 25,000 行，agent 永不全量读取
- **导航优先**：先读取 `references/classical-catalog.md` 确定候选文本和篇章
- **检索后精读**：通过 `scripts/search_classics.ps1` 脚本关键词搜索，定位到具体段落后再读取原文
- **按需取用**：读取的段落数量由用户需求决定，不由预算决定；但不读无关文本
