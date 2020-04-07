# README

# chat-space DB設計
## usersテーブル
|Column|Type|Options|
|-----|----|-------|
|email|string|null: false, unique: true|
|password|string|null: false|
|username|string|null: false, unique: true, index: true|
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
|body|text|null: false|
|image|string||
|user|references|null: false, foreign_key: true|
|group|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :group

