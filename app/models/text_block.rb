class TextBlock < ActiveRecord::Base
  has_one :task_component, as: :component
  has_one :task, through: :task_component

  after_commit :touch_task, :touch_task_component

  validates :body, presence: true, length: { minimum: 1 }

  include IsEmbeddable
  create_type_name 'Text'

  include RendersMarkdown
  renders_markdown :body


  def touch_task
    self.task.touch
  end

  def touch_task_component
    self.task_component.touch
  end
end
