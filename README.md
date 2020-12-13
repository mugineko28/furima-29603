## users テーブル


|Column              | Type    | Options                |
| ------------------ | ------- | ---------------------- |
| name               | string  | null:false             |
| email              | string  | null:false,unique:true |
| encrypted_password | string  | null:false             | 
| last_name          | string  | null:false             |
| first_name         | string  | null:false             |
| last_name_reading  | string  | null:false             |
| first_name_reading | string  | null:false             |
| birthday           | date    | null:false             |

### Association

- has_many :products
- has_many :purchase_information



## products テーブル

|Column                  | Type       | Options                       |
| ---------------------- | ---------- | ----------------------------- |
| user                   | references | null:false, foreign_key: true |
| name                   | string     | null:false                    |
| details                | text       | null:false                    |
| price                  | integer    | null:false                    |
| category_id            | integer    | null:false                    |
| status_id              | integer    | null:false                    |
| shipping_charges_id    | integer    | null:false                    |
| prefectures_id         | integer    | null:false                    |
| days_to_skip_id        | integer    | null:false                    |


### Association

- belongs_to :user
- has_one :purchase_information 

## Address テーブル

| Column                | Type        | Options                         | 
| --------------------- | ----------- | ------------------------------- |
| street_address        | string      | null:false                      |
| prefecture_id        | integer     | null:false                      |
| postal_code           | string      | null:false                      |
| municipality          | string      | null:false                      |
| building_name         | string      |                                 |
| phone_number          | string      | null:false                      |
| purchase_information  | references  | null:false, foreign_key: true   |
 

### Association

- belongs_to :purchase_information



## Purchase information テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ | 
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address



