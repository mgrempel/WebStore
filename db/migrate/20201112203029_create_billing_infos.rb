class CreateBillingInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :billing_infos do |t|
      t.string :card_type
      t.integer :card_number
      t.string :expiry_date

      t.timestamps
    end
  end
end
