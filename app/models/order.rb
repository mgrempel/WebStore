class Order < ApplicationRecord
  has_one :user
  has_many :order_items
end
