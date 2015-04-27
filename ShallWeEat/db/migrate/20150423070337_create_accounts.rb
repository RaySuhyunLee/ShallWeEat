class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :pass
      t.string :email
      t.integer :gender
      t.date :birth

      t.timestamps null: false
    end
  end
end
