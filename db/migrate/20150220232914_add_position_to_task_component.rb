class AddPositionToTaskComponent < ActiveRecord::Migration
  def change
    add_column :task_components, :positioning, :string
  end
end
