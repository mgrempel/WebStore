class ChangeCardNumberBillingInfosToBigInt < ActiveRecord::Migration[6.0]
  def change
    change_column :billing_infos, :card_number, :bigint
  end
end
