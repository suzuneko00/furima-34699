# データベース設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association

-has_many :items
-has_many :orders

## items テーブル

| Column              | Type       | Options           |
| ------------------- | ---------- | ----------------- |
| name                | string     | null: false       |
| comment             | text       | null: false       |
| category_id         | integer    | null: false       |
| condition_id        | integer    | null: false       |
| delivery_charges_id | integer    | null: false       |
| area_id             | integer    | null: false       |
| delivery_date_id    | integer    | null: false       |
| price               | integer    | null: false       |
| user                | references | foreign_key: true |

### Association

-belongs_to :user
-has_one :order

## orders テーブル

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| user    | references | foreign_key: true |
| item    | references | foreign_key: true |

### Association

-belongs_to :user
-belongs_to :item
-has_one :orders_information

## order_details テーブル

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| postal_code      | string     | null: false       |
| prefectures_id   | integer    | null: false       |
| municipalities   | string     | null: false       |
| address          | string     | null: false       |
| building_name    | string     | 
| telephone_number | string     | null: false       |
| order            | references | foreign_key: true |

### Association

-belongs_to :order
