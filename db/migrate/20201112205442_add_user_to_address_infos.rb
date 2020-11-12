class AddUserToAddressInfos < ActiveRecord::Migration[6.0]
  def change
    add_reference :address_infos, :user, null: false, foreign_key: true
  end
end
