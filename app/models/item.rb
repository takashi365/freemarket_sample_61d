class Item < ApplicationRecord
  has_many :images
  accepts_nested_attributes_for :images
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 299, less_than: 9999999}
end
