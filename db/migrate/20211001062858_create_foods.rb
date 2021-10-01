class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :logo
      t.string :desc

      t.timestamps
    end
  end
end
