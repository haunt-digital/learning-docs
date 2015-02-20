class CreateTextBlocks < ActiveRecord::Migration
  def change
    create_table :text_blocks do |t|
      t.text :body

      t.belongs_to :task

      t.timestamps
    end
  end
end
