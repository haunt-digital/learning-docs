class CreateCompetencies < ActiveRecord::Migration
  def change
    create_table :competencies do |t|
      t.string :title

      t.timestamps
    end
  end
end
