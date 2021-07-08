# テーブル設計

## users テーブル

| column                | type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| password              | string | null: false |
| password_confirmation | string | null: false |
| first_name            | string | null: false |
| family_name           | string | null: false |
| first_name_kana       | string | null: false |
| family_name_kana      | string | null: false |
| birthday              | string | null: false |

### Association
- has_many :item
- has_many :purchase

## items テーブル

| column          | type       | Options     |
| --------------- | ---------- | ----------- |
| image           | string     | null: false |
| name            | string     | null: false |
| introduction    | text       | null: false |
| category        | integer    | null: false |
| item_condition  | integer    | null: false |
| postage_payer   | integer    | null: false |
| shipping_area   | string     | null: false |
| preparation_day | integer    | null: false |
| price           | integer    | null: false |
| user            | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- has_one :purchase

## purchases テーブル

| column     | type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- belong_to :item
- has_many :deliveries

## deliveries テーブル

| column       | type    | Options     |
| ------------ | ------- | ----------- |
| postal_code  | integer | null: false |
| prefecture   | string  | null: false |
| city         | string  | null: false |
| address      | integer | null: false |
| phone_number | integer | null: false |

### Association
- belong_to :purchases
