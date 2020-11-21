class Contact < ApplicationRecord
  validates :phone, :email, :other, presence: true
  validates :phone, length: { maximum: 30 }
  validates :email, length: { maximum: 30 }
  validates :other, length: { maximum: 300 }
end
