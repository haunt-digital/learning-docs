class CreateCompetenciesAndSkills < ActiveRecord::Migration
  def change
    create_table :competencies_skills, id: false do |t|
      t.belongs_to :competency, index: true
      t.belongs_to :skill, index: true
    end
  end
end
