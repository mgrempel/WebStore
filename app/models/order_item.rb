class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :items

  validates :item_price, presence: true
  validates :item_price, numericality: { greater_than: 0 }
end
