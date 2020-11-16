class Order < ApplicationRecord
  has_one :user
  has_many :order_items

  validates :order_date, presence: true
  validates :order_date, timeliness: { on_or_before: -> { Date.current }, type: :date }
end
