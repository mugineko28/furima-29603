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
| date               | string  | null:false             |

### Association

- has_many :products
- belongs_to :address


## products テーブル

|Column            | Type   | Options    |
| ---------------- | ------ | ---------- |
| product_name     | string | null:false |
| product_details  | string | null:false |
| price            | string | null:false |

### Association

- belongs_to :users
- belongs_to :purchase_information 

## Address テーブル

| Column                | Type    | Options      | 
| --------------------- | ------- | ------------ |
| street_address        | string  | null:false   |
| prefectures           | string  | null:false   |
| postal_code           | string  | null:false   |
| municipality          | string  | null:false   |
| building_name         | string  | null:false   |
| phone_number          | string  | null:false   |
| purchase_information  | string  | null:false   |
 



### Association

- belongs_to :users
- belongs_to :purchase_information


## Purchase information テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ | 
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |


### Association

- belongs_to :purchase_information
- belongs_to :address


