class OrderItem < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :item, optional: true

  validates :item_price, presence: true
  validates :item_price, numericality: { greater_than: 0 }
end
