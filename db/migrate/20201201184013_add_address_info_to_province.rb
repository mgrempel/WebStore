class AddAddressInfoToProvince < ActiveRecord::Migration[6.0]
  def change
    add_reference :provinces, :address_info, null: false, foreign_key: true
  end
end
