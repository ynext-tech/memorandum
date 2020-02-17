# README

## 「アプリケーションの概要」 
東京都内の美味しいお店の紹介と自身の備忘録のためのアプリケーション

## 「アプリケーションの機能一覧」 
- ユーザー登録機能
    - deviseを利用して、ウィザード形式でsessionに保存していきながら登録する
- 投稿機能
    - carrierwaveを利用して、S3に画像をアップロードして画像投稿
    - geocorderを利用して、入力された住所からgooglemapを表示する
    - MySQLにデータを保存
- 詳細ページ表示
- 投稿内容の編集、削除


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
|latitude|float|null: false|
|longitude|float|null: false|
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