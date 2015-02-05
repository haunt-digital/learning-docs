class CreateExternalResources < ActiveRecord::Migration
  def change
    create_table :external_resources do |t|
      t.string :title
      t.string :uri
      t.text :description

      t.timestamps
    end
  end
end
