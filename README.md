# README

## 「アプリケーションの概要」 
:sushi:東京都内の美味しいお店の紹介と自身の備忘録のためのアプリケーション:sushi:
http://3.112.0.236/

## 「アプリケーションの機能一覧」 
- ユーザー登録機能
    - deviseを利用して、ウィザード形式でsessionに保存していきながら登録する
- 詳細ページ表示(ログインなしで閲覧可)
- 投稿機能(ログインすると投稿可)
    - carrierwaveを利用して、S3に画像をアップロードして画像投稿
    - geocorderを利用して、入力された住所からgooglemapを表示する
    - MySQLにデータを保存
- 投稿内容の編集、削除(その投稿したユーザーのみ)

## 「製作背景」
私は鳥取生まれ鳥取育ちの田舎者で、昨年上京しました。
東京には様々な魅力的なお店があります。
そこで、自身で行ったお店や気になっているお店紹介することで自分自身の備忘録としてと地元の友達などが参考にしていただけたらと思い製作いたしました。

## 「今後の実装予定」
- 写真の複数枚投稿、表示
- いいね機能とコメント機能
- 場所、カテゴリー毎での検索機能

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