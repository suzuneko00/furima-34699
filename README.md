# データベース設計

## users テーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| password              | string | null: false |
| password_confirmation | string | null: false |
| last_name             | string | null: false |
| first_name            | string | null: false |
| last_name_kana        | string | null: false |
| first_name_kana       | string | null: false |
| birthday              | date   | null: false |

### Association

-has_many :items
-has_many :orders

## items テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| name             | string | null: false |
| comment          | text   | null: false |
| category         | string | null: false |
| condition        | string | null: false |
| delivery_charges | string | null: false |
| area             | string | null: false |
| delivery_date    | string | null: false |
| price            | string | null: false |

### Association

-belongs_to :users
-has_many :orders

## orders テーブル

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| user_id | references | foreign_key: true |
| item_id | references | foreign_key: true |

### Association

-belongs_to :users
-belongs_to :items
-has_one :orders_information

## orders_information テーブル

| Column           | Type    | Options     |
| ---------------- | --------| ----------- |
| card_number      | integer | null: false |
| expiration_month | date    | null: false |
| expiration_year  | date    | null: false |
| security_code    | integer | null: false |
| postal_code      | integer | null: false |
| address          | string  | null: false |
| telephone_number | integer | null: false |

### Association

-belongs_to :orders 
