class AddAddressInfoToBillingInfo < ActiveRecord::Migration[6.0]
  def change
    change_table(:billing_infos) do |t|
      t.references :billing_address_info_id, foreign_key: { to_table: "address_infos" }
      t.references :shipping_address_info_id, foreign_key: { to_table: "address_infos" }
    end
  end
end
