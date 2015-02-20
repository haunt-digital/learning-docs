class TaskComponent < ActiveRecord::Base
  belongs_to :task
  belongs_to :component, polymorphic: true
end
