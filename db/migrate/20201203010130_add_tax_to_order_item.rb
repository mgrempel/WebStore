class AddTaxToOrderItem < ActiveRecord::Migration[6.0]
  def change
    add_column :order_items, :tax, :decimal
  end
end
