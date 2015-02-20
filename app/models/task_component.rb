class TaskComponent < ActiveRecord::Base
  belongs_to :task
  belongs_to :component, polymorphic: true

  include RankedModel
  ranks :task_order

  POSITIONINGS = %w( full primary secondary )

  validates_inclusion_of :positioning, :in => POSITIONINGS
end
