class Item < ApplicationRecord
  has_many :images
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
end
