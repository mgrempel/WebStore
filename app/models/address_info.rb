class AddressInfo < ApplicationRecord
  has_one :billing_address_info, class_name: "AddressInfo", foreign_key: "billing_address_info_id"
  has_one :shipping_address_info, class_name: "AddressInfo", foreign_key: "shipping_address_info_id"
  belongs_to :user
end
