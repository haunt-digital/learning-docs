class FileUpload < ActiveRecord::Base
  has_one :task_component, as: :component
  has_one :task, through: :task_component

  has_attached_file :file

  validates :title, presence: true, length: { maximum: 128 }
  validates :file, :attachment_presence => true
  validates_with AttachmentSizeValidator, :attributes => :file, :less_than => 10.megabytes
  # DANGER DANGER
  do_not_validate_attachment_file_type :file

  after_commit :touch_task, :touch_task_component

  include IsEmbeddable
  create_type_name 'Upload'

  include RendersMarkdown
  renders_markdown :description


  def touch_task
    self.task.touch
  end

  def touch_task_component
    self.task_component.touch
  end
end
