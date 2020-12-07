class AddressInfo < ApplicationRecord
  belongs_to :province
  belongs_to :user
  has_many :orders

  # canadian_postal_code = /\A[ABCEGHJKLMNPRSTVXY]{1}\\d{1}[A-Z]{1}[ -]?\\d{1}[A-Z]{1}\\d{1}\z/
  validates :address, :postal_code, :city, presence: true
  # validates :postal_code, format: { with: canadian_postal_code }
end
