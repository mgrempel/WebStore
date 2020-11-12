class User < ApplicationRecord
  has_many :orders
  has_many :address_infos
  has_many :billing_infos
end
