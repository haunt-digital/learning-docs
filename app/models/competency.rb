class Competency < ActiveRecord::Base
  has_and_belongs_to_many :skills
  has_many :tasks, through: :skills

  validates :title, length: { maximum: 128 }

  include RelaysCollectionCompleteness
  relays_completeness_for_collections :skills, :tasks

  def skills_complete_for(user)
    skills.marked_as(:complete, :by => user).count
  end
end
