class AddRankToFoods < ActiveRecord::Migration[6.0]
  def change
    add_column :foods, :rank, :float
    add_column :foods, :fav_count, :integer, default: 0
    add_index :order_with_foods, :food_id
    add_index :subscriptions, :user_id
  end
end
