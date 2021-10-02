class CreateOrderWithFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :order_with_foods do |t|
      t.integer :order_id
      t.integer :food_id
      t.integer :qty
      t.integer :subscription_id

      t.timestamps
    end
  end
end
