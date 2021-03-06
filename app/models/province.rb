class Province < ApplicationRecord
  has_many :address_info
  validates :name, :gst, :pst, :hst, presence: true
  validates :gst, :pst, :hst, numericality: { greater_or_equal_to: 0, less_than_or_equal_to: 1 }
end
