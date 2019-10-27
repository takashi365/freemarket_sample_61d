# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## userテーブル

|Column        |Type  |Options                         |
|--------------|------|--------------------------------|
|nickname      |string|null:false,add_index,unique:true|
|email         |string|null:false,add_index,unique:true|
|pasward       |string|null:false                      |
|profile       |text  |--------------------------------|
|phone         |string|null:false,unique:true          |
|first_name    |string|null:false                      |
|last_name     |string|null:false                      |
|address       |string|null:false                      |
|birthday      |string|null:false                      |
|payment_method|string|null:false                      |

## Association
- has_many :items
- has_many :likes
- has_many :coments
- has_many :rates
- has_many :buyer
- has_many :seller

## ratesテーブル

|Column  |Type   |Options                    |
|--------|-------|---------------------------|
|rate    |integer|null:false                 |
|rater_id|integer|null:false,foreign_key:true|
|ratee_id|integer|null:false,foreign_key:true|
|deals_id|integer|null:false,foreign_key:true|

## Association
- belongs_to :deal
- belongs_to :rater
- belongs_to :ratee

## itemsテーブル

|Column         |Type   |Options                    |
|---------------|-------|---------------------------|
|name           |string |null:false,add_index       |
|price          |integer|null:false                 |
|description    |text   |---------------------------|
|status         |integer|null:false                 |
|prefecture     |integer|null:false                 |
|expense        |integer|null:false                 |
|shipping_method|integer|null:false                 |
|arrival_date   |integer|null:false                 |
|like_count     |integer|null:false                 |
|L_category_id  |integer|null:false,foreign_key:ture|
|M_category_id  |integer|null:false,foreign_key:ture|
|S_category_id  |integer|null:false,foreign_key:true|
|size_id        |integer|null:false,foreign_key:true|
|brand_id       |integer|null:false,foreign_key:true|

## Association
- belongs_to :size
- belongs_to :brand
- belongs_to :L_category
- belongs_to :M_category
- belongs_to :S_category
- has_many :images
- has_many :comments
- has_many :likes
- has_many :buyer
- has_many :seller

## Enum 
- status
- prefencture
- expense
- shiiping_method
- arrival_date

## commentsテーブル

|Column |Type   |Options                    |
|-------|-------|---------------------------|
|comment|string |null:false                 |
|user_id|integer|null:false,foreign_key:ture|
|item_id|integer|null:false,foreign_key:true|

## Association
- belongs_to :user
- belongs_to :item

## likesテーブル

|Column |Type   |Options                    |
|-------|-------|---------------------------|
|user_id|integer|null:false,foreign_key:true|
|item_id|integer|null:false,foreign_key:true|

## Association
- belongs_to :user
- belongs_to :item

## dealsテーブル

|Column   |Type   |Options                    |
|---------|-------|---------------------------|
|seller_id|integer|null:false,foreign_key:true|
|buyer_id |integer|null:false,foreign_key:true|
|item_id  |integer|null:false,foreign_key:true|

## Association
- has_one :rate
- belongs_to :item
- belongs_to :buyer
- belongs_to :seller

## Enum
- rate

## L_categoriesテーブル

|Column       |Type  |Options   |
|-------------|------|----------|
|category_name|string|null:false|

## Association
- has_many :items
- has_many :M_categories

## M_categoriesテーブル

|Column       |Type   |Options                    |
|-------------|-------|---------------------------|
|category_name|string |null:false                 |
|L_category_id|integer|null:false,foreign_key:true|

## Association
- belongs_to :L_category
- has_many :items
- has_many :S_categories

## S_categoriesテーブル

|Column       |Type   |Options                    |
|-------------|-------|---------------------------|
|category_name|string |null:false                 |
|M_category_id|integer|null:false,foreign_key:true|

## Association
- belongs_to :M_category
- has_many :items
- has_many :sizes

## sizesテーブル

|Column       |Type   |Options                    |
|-------------|-------|---------------------------|
|size_name    |string |null:false                 |
|S_category_id|integer|null:false,foreign_key:true|

## Association
- belongs_to :S_category
- has_many :items

## brandsテーブル

|Column    |Type  |Options   |
|----------|------|----------|
|brand_name|string|null:false|

## Association
- has_many :items

## imagesテーブル

|Column   |Type   |Options                    |
|---------|-------|---------------------------|
|image_url|string |null:false                 |
|items_id |integer|null:false,foreign_key:true|

## Association
- belongs_to :item