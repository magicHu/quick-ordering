class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :restaurant_id
      t.string :order_no
      t.date :order_day
      t.integer :order_status, :default => 1
      t.decimal :total_price, :default => 0

      t.timestamps
    end
  end
end
