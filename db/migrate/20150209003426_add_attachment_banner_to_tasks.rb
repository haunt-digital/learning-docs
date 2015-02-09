class AddAttachmentBannerToTasks < ActiveRecord::Migration
  def self.up
    change_table :tasks do |t|
      t.attachment :banner
    end
  end

  def self.down
    remove_attachment :tasks, :banner
  end
end
