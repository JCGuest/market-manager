class CreateClerks < ActiveRecord::Migration[5.2]
  def change
    create_table :clerks do |t|
      t.string :email
      t.string :password_digest
      t.string :title

      t.timestamps
    end
  end
end
