# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

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