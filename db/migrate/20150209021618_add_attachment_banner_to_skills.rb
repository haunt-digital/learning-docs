class AddAttachmentBannerToSkills < ActiveRecord::Migration
  def self.up
    change_table :skills do |t|
      t.attachment :banner
    end
  end

  def self.down
    remove_attachment :skills, :banner
  end
end
