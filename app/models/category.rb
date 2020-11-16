class Category < ApplicationRecord
  has_and_belongs_to_many :items
  has_one_attached :image

  validates :name, :description, presence: true
  validates :name, length: { maximum: 15 }
  validates :description, length: { maximum: 300 }
end
