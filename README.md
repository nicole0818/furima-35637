# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| nickname           | string | null: false              |
| email              | string | null: false,unique: true |
| encrypted_password | string | null: false              |
| name(first name)   | string | null: false              |
| name(last name)    | string | null: false              |  
| birthday           | string | null: false              |

has_many :products
has_many :purchase records

## products テーブル

| Column                  | Type       | Options           |
| ----------------------- | ---------- | ----------------- |
| product name            | string     | null: false       |
| user_id                 | references | foreign_key: true |
| category_id             | integer    |    null: false    |
| product explanation     | text       |    null: false    |
| product status_id       | integer    |    null: false    |
| product price           | integer    |    null: false    |
| delivery information_id | integer    |    null: false    |
| delivery place_id       | integer    |    null: false    |
| delivery time_id        | integer    |    null: false    |

belongs_to :user
belongs_to :place
belongs_to :purchase record


## places テーブル

| Column            | Type   | Options            |
| ----------------- | -------| ------------------ |
| prefectures_id    | integer|    null: false     |
| city              | string |    null: false     |
| address           | string |    null: false     |
| building name     | string |                    |
| telephone number  | string |    null: false     |

belongs_to :product
belongs_to :purchase record



## purchase records テーブル

| Column           | Type       | Options           |
| ---------------- | ---------- | ------------------|
| user_id          | references | foreign_key: true |
| product_id       | references | foreign_key: true |

has_many :users
has_many :products