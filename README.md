README.md

## アプリ名
### recipesharing(レシピ共有アプリ)

## 概要
##### ユーザー新規登録機能
##### ユーザーログイン機能
##### ユーザーログアウト機能
##### レシピ投稿機能
##### レシピ検索機能
##### レシピに対するコメント機能
##### レシピに対するいいね機能
##### レシピいいね数に応じてのランキング機能


## 本番環境
https://murmuring-retreat-81222.herokuapp.com/

###### ID/Pass
 #### ・ID: ak
 #### ・Pass: 678

##### ログイン情報(テスト用)
 #### ・Eメール: test@7.com
 #### ・パスワード: asd678
 
## 制作背景(意図)
##### オリジナルアプリを作る過程として最初はどういうものを作るか迷い、いろんなサイトを巡りみんながオリジナルで作っているアプリはどのようなものかと探り、最終的に私は自分が普段よくしていることに関してアプリを作ることに決めました。そして私が普段よくしていることが料理でこのアプリでレシピを共有できれば自分の作ったことがない料理や自分の作ったことのある料理や自分の得意な料理もまた違う人のレシピを見ることで色々アレンジしたりすることができるんじゃないかと思いこのアプリを作りました。

## DEMO

## 工夫したポイント
##### このアプリではレシピを投稿する際に画像を複数使用して投稿するため画像を選択したらプレビューが出るようにしたり画像を表示したと同時に「画像を削除します」というようにすぐに画像を削除できるように実装しました。

## 使用技術（開発環境）

### バックエンド
Ruby, Ruby on Rails

### フロントエンド
HTML, CSS, Javascript, Jquery

### データーベース
PostgreSQL

### WEBサーバー
Heroku

### ソース管理
Git, GitHubDesctop

### エディタ
VSCode

## 課題や今後実装したい機能
##### 課題はJavascriptで思った通りの機能がなかなか実装できずに時間を割いてしまったことです。今後はこの経験を生かしてうまく実装できなかったら初心に戻りいろんな人の意見やサイトを参考にして実装を進めていきたいと思いました。
##### 今後はPHPやjqueryをもっといろんなアプリに活用できるように学び、このアプリでも画像だけではなく動画を投稿できるように実装していきたいと思います


## DB設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false, unique: true |
| encrypted_password | string | null: false |
| sex_id   | integer| null: false |
| cooking_experience_id | integer | null: false |

### Association

- has_many :cookings,dependent: :destroy
- has_many :comments
- has_many :likes, dependent: :destroy



 ## cooking テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| cooking_name | string | null: false |
| point    | string |             |
| recipe   | string | null: false |
| user_id  | integer| null: false, foreign_key: true |

### Association
- has_many :comments, dependent: :destroy
- belongs_to :user
- has_many :likes, dependent: :destroy
- has_many_attached :images




## comments テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| text     | text   | null: false  |
| user_id  | integer｜null: false, foreign_key: true |
| cooking_id|integer |null: false, foreign_key: true |

 ### Association
- belongs_to :user
- belongs_to :cooking


## likeテーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| cooking  | references|null: false, foreign_key: true |
| user     | references｜null: false, foreign_key: true |

### Association
- belongs_to :cooking
- belongs_to :user
