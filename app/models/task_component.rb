class TaskComponent < ActiveRecord::Base
  belongs_to :task
  belongs_to :component, polymorphic: true

  include RankedModel
  ranks :task_order

  POSITIONINGS = %w( full primary secondary )

  validates_inclusion_of :positioning, :in => POSITIONINGS

  def self.creatable_models
    [TextBlock, FileUpload]
  end


  def positionings
    POSITIONINGS
  end
end
