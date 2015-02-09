class CreateSkillsAndTasks < ActiveRecord::Migration
  def change
    create_table :skills_tasks, id: false do |t|
      t.belongs_to :skill, index: true
      t.belongs_to :task, index: true
    end
  end
end
