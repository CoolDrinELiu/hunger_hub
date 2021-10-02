class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :category, default: 0
      t.integer :user_id
      t.date :start_since

      t.timestamps
    end
  end
end
