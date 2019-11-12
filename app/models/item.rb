class Item < ApplicationRecord
  has_many :images
  accepts_nested_attributes_for :images
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true


  enum status:{
    "---":0,
    新品・未使用:1,未使用に近い:2,目立った傷や汚れなし:3,やや傷や汚れあり:4, 汚れや傷あり:5,
    全体的に状態が悪い:6
    },_prefix: true
  
end
