class AddTaskOrderToTaskComponent < ActiveRecord::Migration
  def change
    add_column :task_components, :task_order, :integer
  end
end
