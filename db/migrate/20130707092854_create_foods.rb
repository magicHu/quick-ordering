class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.integer :category_id
      t.integer :restaurant_id
      t.string :name
      t.text :desc
      t.decimal :price

      t.timestamps
    end
  end
end
