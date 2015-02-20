class TextBlock < ActiveRecord::Base
  has_one :task_component, as: :component
  has_one :task, through: :task_component

  after_commit :touch_task

  validates :body, presence: true, length: { minimum: 1 }

  def touch_task
    self.task.touch
  end
end
