# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| nickname           | string | null: false              |
| email              | string | null: false,unique: true |
| encrypted_password | string | null: false              |
| last_name_kanji    | string | null: false              |
| first_name_kanji   | string | null: false              |  
| last_name_kana     | string | null: false              |
| first_name_kana    | string | null: false              |  
| birthday           | date   | null: false              |

has_many :products
has_many :purchase_records

## products テーブル

| Column                  | Type       | Options           |
| ----------------------- | ---------- | ----------------- |
| product_name            | string     | null: false       |
| user                    | references | foreign_key: true,null: false |
| category_id             | integer    |    null: false    |
| product_explanation     | text       |    null: false    |
| product_status_id       | integer    |    null: false    |
| product_price           | integer    |    null: false    |
| delivery_information_id | integer    |    null: false    |
| prefectures_id          | integer    |    null: false    |
| delivery_time_id        | integer    |    null: false    |

belongs_to :user
has_one :purchase_record



## places テーブル

| Column            | Type      | Options            |
| ----------------- | ----------| ------------------ |
| postal_code       | string    |    null: false     |
| prefectures_id    | integer   |    null: false     |
| city              | string    |    null: false     |
| address           | string    |    null: false     |
| building_name     | string    |                    |
| telephone_number  | string    |    null: false     |
| purchase_record   | references| foreign_key: true,null: false  |    

belongs_to :purchase_record



## purchase_records テーブル

| Column        | Type       | Options           |
| ------------- | ---------- | ------------------|
| user          | references | foreign_key: true,null: false |
| product       | references | foreign_key: true,null: false |

belongs_to :user
belongs_to :product
has_one :place