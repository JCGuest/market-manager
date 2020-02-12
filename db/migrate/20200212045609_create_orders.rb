class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :patron_id
      t.integer :clerk_id
      t.string :item
      t.date :pick_up

      t.timestamps
    end
  end
end
