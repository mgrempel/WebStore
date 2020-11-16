class About < ApplicationRecord
  validates :title, length: { maximum: 30 }
  validates :content, length: { maximum: 500 }
  validates :title, :content, presence: true
end
