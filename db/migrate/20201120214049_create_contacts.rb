class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :phone
      t.string :email
      t.string :other

      t.timestamps
    end
  end
end
