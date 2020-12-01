class Province < ApplicationRecord
  belongs_to :address_info
  validates :name, :gst, :pst, :hst, presence: true
  validates :gst, :pst, :hst, numericality: { greater_than: 0, less_than: 1 }
end