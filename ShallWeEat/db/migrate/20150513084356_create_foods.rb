class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.integer :spicy
      t.integer :sour
      t.integer :sweet
      t.integer :salty
      t.integer :bitter
      t.integer :hot
      t.integer :cold
      t.integer :calories
      t.integer :time
      t.integer :price
      t.string :image
			t.string :tag
			t.timestamps null: false
    end


  end
end
