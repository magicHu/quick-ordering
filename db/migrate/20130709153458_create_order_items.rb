class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :order_id
      t.string :food_id
      t.decimal :food_price
      t.integer :quantity
      t.decimal :total_price

      t.timestamps
    end
  end
end
