class AddressInfo < ApplicationRecord
  belongs_to :province
  has_one :billing_address_info, class_name: "AddressInfo", foreign_key: "billing_address_info_id"
  has_one :shipping_address_info, class_name: "AddressInfo", foreign_key: "shipping_address_info_id"
  belongs_to :user

  canadian_postal_code = /\A[ABCEGHJKLMNPRSTVXY]{1}\\d{1}[A-Z]{1}[ -]?\\d{1}[A-Z]{1}\\d{1}\z/
  validates :address, :postal_code, :city, :province, :country, presence: true
  validates :postal_code, format: { with: canadian_postal_code }
end
