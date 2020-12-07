class AddTaxRateToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :tax_rate, :decimal
  end
end
