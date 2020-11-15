class RenameItemItemNameToName < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :item_name, :name
  end
end
