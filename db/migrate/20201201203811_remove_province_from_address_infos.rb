class RemoveProvinceFromAddressInfos < ActiveRecord::Migration[6.0]
  def change
    remove_column :address_infos, :province
  end
end
