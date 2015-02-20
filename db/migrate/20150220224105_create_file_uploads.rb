class CreateFileUploads < ActiveRecord::Migration
  def change
    create_table :file_uploads do |t|
      t.string :title
      t.text :description

      t.belongs_to :task

      t.attachment :file

      t.timestamps
    end
  end
end
