## 運用および指示ルール

### 言語方針
- 各種指示・コメント・タスクは **日本語で行う** こと。  
  - 英語を使用する場合は、外部連携やOSS投稿など、明示的に英語が求められる場面に限る。  
  - コードやコマンドなど技術要素は原文（英語）のままでよい。

---

### Git 運用ルール

#### ブランチ運用
- 新規の修正を開始する際は、**必ず新しいブランチを作成**する。  
  - ブランチ名の命名規則（推奨）：

    ```
    feature/<概要>   # 機能追加
    fix/<概要>       # バグ修正
    docs/<概要>      # ドキュメント修正
    chore/<概要>     # CIや設定変更など
    ```

  - 例:  
    - `feature/approve-notification`  
    - `docs/update-agents-guide`

#### コミット運用
- コミットは **小さな単位（論理的な変更ごと）** で行う。  
- コミットメッセージには、**変更内容の分類がわかる絵文字**を付ける。  
  - 絵文字は一般的な運用に沿うこと。

| 絵文字 | 用途 | 例 |
|:--|:--|:--|
| ✨ `:sparkles:` | 新機能追加 | `✨ add approve-wait notification` |
| 🐛 `:bug:` | バグ修正 | `🐛 fix incorrect agent timeout handling` |
| 📝 `:memo:` | ドキュメント修正 | `📝 update AGENTS.md for workflow guide` |
| 🧹 `:broom:` | コード整理・軽微な修正 | `🧹 cleanup unused imports` |
| 🔧 `:wrench:` | 設定・ビルド関連 | `🔧 update codex config` |
| 🚑 `:ambulance:` | 緊急修正 | `🚑 fix crash on agent startup` |
| ♻️ `:recycle:` | リファクタリング | `♻️ refactor notification handler` |
| ✅ `:white_check_mark:` | テスト関連 | `✅ add approval flow tests` |
| 🗑️ `:wastebasket:` | 不要コード削除 | `🗑️ remove legacy agent hooks` |
| 🚀 `:rocket:` | パフォーマンス改善・リリース | `🚀 improve startup latency` |

##### コミットメッセージ形式
```
<絵文字> : <概要>
```

### Pull Request（PR）運用ルール

#### PR 作成
- PR は **必ず `.github/pull_request_template.md`** に沿って作成する。  
  - テンプレートに沿って以下の情報を明記すること：  
    - 変更の目的（なぜこの修正を行うのか）  
    - 主な変更内容（どのファイル・機能に影響するか）  
    - 確認方法／動作確認手順  
    - 影響範囲・リスク・補足事項など
- PR のタイトルは、大まかな修正内容を日本語でつける
  - 案件の修正である場合は案件名をprefixにつける
  - 例: 支払い方法変更案件: Gateway処理の追加
- WIP（作業中）の場合は、タイトルの先頭に `[WIP]` を付けるか、Draft PR として作成する。  
- **1 PR につき1トピック**を原則とし、複数の独立した修正をまとめない。
