class AddProvinceToAddressInfos < ActiveRecord::Migration[6.0]
  def change
    add_reference :address_infos, :province, null: false, foreign_key: true
  end
end
