class CreateRakeLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :rake_logs do |t|
      t.string :title
      t.text :message
      t.boolean :status

      t.timestamps
    end
  end
end
