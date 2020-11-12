class BillingInfo < ApplicationRecord
  belongs_to :user
  belongs_to :address_info
end
