class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.integer :food_id
      t.integer :user_id
      t.integer :qty, default: 1
      t.integer :order_id

      t.timestamps
    end
  end
end
