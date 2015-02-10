class Competency < ActiveRecord::Base
  has_and_belongs_to_many :skills
  has_many :tasks, through: :skills

  validates :title, length: { maximum: 128 }

  include ScoresCollectionCompletion
  scores_completion_for_collections :skills, :tasks

  def skills_complete_for(user)
    skills.marked_as(:complete, :by => user).count
  end
end
