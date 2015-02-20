class DropExternalResources < ActiveRecord::Migration
  def change
    remove_index :external_resources, :task_id
    drop_table :external_resources
  end
end
