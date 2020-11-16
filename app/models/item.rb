class Item < ApplicationRecord
  has_many :order_items
  has_and_belongs_to_many :categories
  has_one_attached :image

  validates :name, :description, :price, presence: true
  validates :name, length: { maximum: 30 }
  validates :description, length: { maximum: 500 }
  validates :markdown, :price, numericality: { greater_than: 0 }
  validates :markdown, numericality: { less_than: :price }
end
