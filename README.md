# README
## 東京都内の美味しいお店の紹介と自身の備忘録のためのアプリケーション ##

# remorandum DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|
|prefecture|integer|null: false|
### Association
- has_many :shops

## shopsテーブル
|Column|Type|Options|
|------|----|-------|
|shop_name|string|null: false|
|text|text|null: false|
|address|string|null: false|
|phone|integer|null: false|
|time|string|
|price|string|
|gurunabi|string|
|user_id|reference|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :images
- has_many :comments

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string||
|shop_id|references|foreign_key: true|
### Association
- belongs_to :shop

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|text|
|shop_id|references|foreign_key: true|
### Association
- belongs_to :shop