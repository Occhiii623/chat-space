# README
テックキャンプでの課題として、チャットアプリケーションを作成しました。
この技術を使ってこうしてください、などの指示はあるものの、基本的には自分で考えて実装していくスタイル。
GitHubを利用し、レビュワーにプルリクエストを行い修正を行うという開発スタイルでした。
また完成後、AWSを使用してデプロイまで行いました。

### 実装した機能
- ログイン機能
- チャットグループの作成 
- インクリメンタルサーチの実装 
- メッセージの非同期通信 
- 5秒毎に自動更新を行うことでチャットとしての機能を実装

<h3 align="center">- メッセージ非同期通信 -</h3>
<p align="center">
<img src="https://user-images.githubusercontent.com/62282502/85027450-e73d3800-b1b4-11ea-9ca1-7053ee7133fd.gif" width="500px">
</p>

<h3 align="center">- 自動更新機能 -</h3>
<p align="center">
<img src="https://user-images.githubusercontent.com/62282502/85027616-15bb1300-b1b5-11ea-98e6-ad3ffb0218f1.gif" width="500px">
</p>


# chat-space DB設計
## usersテーブル
|Column|Type|Options|
|-----|----|-------|
|email|string|null: false, unique: true|
|password|string|null: false|
|name|string|null: false, unique: true, index: true|
### Association
- has_many :groups, through: :groups_users
- has_many :groups_users
- has_many :messages

## groupsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true, index: true|
### Association
- has_many  :users,  through:  :groups_users
- has_many :groups_users
- has_many: messages

## gourps_usersテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true, index: true|
|group|references|null: false, foreign_key: true, index: true|
### Association
- belongs_to :user
- belongs_to  :group

## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|body|text||
|image|string||
|user|references|null: false, foreign_key: true|
|group|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :group

