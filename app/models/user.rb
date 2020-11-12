class User < ApplicationRecord
  has_many :orders
  has_many :address_infos
end
