class CreateSettings < ActiveRecord::Migration[6.0]
  def change
    create_table :settings do |t|
      t.datetime :cut_off_at

      t.timestamps
    end
  end
end
