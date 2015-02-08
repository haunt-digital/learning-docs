class AddExternalResroucesToTask < ActiveRecord::Migration
  def change
    add_column :external_resources, :task_id, :integer
    add_index :external_resources, :task_id
  end
end
