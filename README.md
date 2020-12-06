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
| birthday           | string  | null:false             |

### Association

- has_many :name
- has many :email
- has many :encrypted_password
- has many :last_name
- has_many :first_name
- has_many :last_name_reading
- has_many first_name_reading
- has_many birthday



## products テーブル

|Column            | Type   | Options    |
| ---------------- | ------ | ---------- |
| images           | string | null:false |
| product_name     | string | null:false |
| product_details  | string | null:false |
| price            | string | null:false |

### Association

- belongs_to :images
- belongs_to :product_name
- belongs_to :product_details
- belongs_to :price


## Address テーブル

| Column          | Type    | Options      | 
| --------------- | ------- | ------------ |
| street_address  | string  | null:false   |
| prefectures     | string  | null:false   |
| postal_code     | string  | null:false   |
| municipality    | string  | null:false   |
| address         | string  | null:false   |
| building_name   | string  | unique: true |
| phone_number    | string  | null:false   |




### Association

- belongs_to :street_address
- belongs_to :prefectures
- belongs_to :postal_code
- belongs_to :municipality
- belongs_to :address
- belongs_to :building_name
- belongs_to :phone_number


## Purchase information テーブル

| Column               | Type    | Options    |
| -------------------- | ------- | ---------- | 
| Purchase_information | string  | null:false |


### Association

-  belongs_to :purchase_information


