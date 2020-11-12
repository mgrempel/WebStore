class CreateOrderItems < ActiveRecord::Migration[6.0]
  def change
    create_table :order_items do |t|
      t.decimal :item_price

      t.timestamps
    end
  end
end
