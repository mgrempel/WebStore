class BillingInfo < ApplicationRecord
  belongs_to :user
  belongs_to :address_info

  validates :card_type, :card_number, :expiry_date, presence: true
  validates
  # Custom validation for big integers.
  validates_format_of :card_type, with: /^[0-9]{3}\.[0-9]{3}\.[0-9]{3}\-[0-9]{2}$/
  validates_format_of :expiry_date, with: %r{\b(0[1-9]|1[0-2])/?([0-9]{4}|[0-9]{2})\b}
end
