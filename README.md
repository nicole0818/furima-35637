# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| mail address       | string | null: false |
| password           | string | null: false |
| name(first name)   | string | null: false |
| name(last name)    | string | null: false |  

has_many :products
has_many :purchase records

## products テーブル

| Column               | Type       | Options           |
| -------------------- | ---------- | ----------------- |
| product name         | string     | null: false       |
| name(first name)     | references | foreign_key: true |
| name(last name)      | references | foreign_key: true |
| image                | string     |    null: false    |
| category             | string     |    null: false    |
| product explanation  | string     |    null: false    |
| product status       | string     |    null: false    |
| product price        | string     |    null: false    |
| delivery information | string     |    null: false    |
| delivery place       | string     |    null: false    |
| delivery time        | string     |    null: false    |

belongs_to :users
belongs_to :places


## places テーブル

| Column            | Type   | Options            |
| ----------------- | -------| ------------------ |
| card information  | string |    null: false     |
| card limit        | string |    null: false     |
| security code     | string |    null: false     |
| postal code       | string |    null: false     |
| prefectures       | string |    null: false     |
| city              | string |    null: false     |
| address           | string |    null: false     |
| building name     | string |                    |
| telephone number  | string |    null: false     |

belongs_to :products



## purchase records テーブル

| Column           | Type       | Options           |
| ---------------- | ---------- | ------------------|
| name(first name) | references | foreign_key: true |
| name(last name)  | references | foreign_key: true |

has_many :users