class Item < ApplicationRecord
  has_many :order_items
  has_and_belongs_to_many :categories
  has_one_attached :image
end
