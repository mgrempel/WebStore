class RemoveTaxFromOrderItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :order_items, :tax, :decimal
  end
end
