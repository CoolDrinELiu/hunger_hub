class AddEndAtToFood < ActiveRecord::Migration[6.0]
  def change
    add_column :foods, :end_at, :datetime
  end
end
