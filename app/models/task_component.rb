class TaskComponent < ActiveRecord::Base
  belongs_to :task
  belongs_to :component, polymorphic: true

  include RankedModel
  ranks :task_order
end
