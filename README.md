# テーブル設計

## users テーブル

| Column          | Type    | Options                   |
| --------------- | ------- | ------------------------- |
| nickname        | string  | null: false               |
| email           | string  | null: false, unique: true |
| password        | string  | null: false               |
| last_name       | string  | null: false               |
| first_name      | string  | null: false               |
| last_name_kana  | string  | null: false               |
| first_name_kana | string  | null: false               |
| birth_year      | integer | null: false               |
| birth_month     | integer | null: false               |
| birth_day       | integer | null: false               |

### Association

- has_many :items
- has_many :purchase_records

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| title         | string     | null: false                    |
| description   | text       | null: false                    |
| category      | integer    | null: false                    |
| condition     | integer    | null: false                    |
| shipping_fee  | integer    | null: false                    |
| shipping_from | integer    | null: false                    |
| shipping_date | integer    | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase_record
- has_one :address

## purchase_records テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

## addresses テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | string     | null: false                    |
| prefecture   | integer    | null: false                    |
| district     | string     | null: false                    |
| address_code | string     | null: false                    |
| building     | string     |                                |
| telephone    | string     | null: false                    |
| item         | references | null: false, foreign_key: true |

### Association

- belongs_to :item
