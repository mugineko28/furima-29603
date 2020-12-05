## users テーブル


|Column          | Type    | Options    |
| -------------- | ------- | ---------- |
| ユーザー新規登録  | string  | null:false |
| ユーザー名       | string  | null:false |
| ログイン         | string  | null:false | 

### Association

- has_many :ユーザー新規登録
- has many :ユーザー名
- has many :ログイン 


## products テーブル

|Column   | Type   | Options   |
| ------  | ------ | --------- |
| 商品出品 | string | null:false |
| 商品情報 | string | null:false |
| 写真    | string | null:false |

### Association

- has_many :商品出品
- has_many :商品情報
- has_many :写真


## Address テーブル

| Column  | Type   | Options      | 
| ------- | ------ | ------------ |
| 住所     | string  | null:false |
| 郵便番号  | string  | null:false |

### Association

- belongs_to :住所
- belongs_to :郵便番号


## Purchase information テーブル

| Column  | Type    | Options    |
| ------- | ------- | ---------- | 
| 購入機能 | string  | null:false |

### Association

-  has_many 購入機能


