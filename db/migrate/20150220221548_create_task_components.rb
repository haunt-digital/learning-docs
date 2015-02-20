class CreateTaskComponents < ActiveRecord::Migration
  def change
    create_table :task_components do |t|
      t.belongs_to :task, index: true

      t.integer :component_id
      t.string :component_type

      t.timestamps
    end
  end
end
