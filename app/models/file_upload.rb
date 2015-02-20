class FileUpload < ActiveRecord::Base
  has_one :task_component, as: :component
  has_one :task, through: :task_component

  has_attached_file :file

  validates :file, :attachment_presence => true
  validates_with AttachmentSizeValidator, :attributes => :file, :less_than => 10.megabytes
  # DANGER DANGER
  do_not_validate_attachment_file_type :file


  after_commit :touch_task

  validates :title, presence: true, length: { maximum: 128 }

  def touch_task
    self.task.touch
  end
end
