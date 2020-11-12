class CreateAddressInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :address_infos do |t|
      t.string :address
      t.string :address2
      t.string :postal_code
      t.string :city
      t.string :province
      t.string :country

      t.timestamps
    end
  end
end
