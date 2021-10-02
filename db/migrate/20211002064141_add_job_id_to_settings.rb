class AddJobIdToSettings < ActiveRecord::Migration[6.0]
  def change
    add_column :settings, :job_id, :string
  end
end
