class Competency < ActiveRecord::Base
  has_and_belongs_to_many :skills
  has_many :tasks, through: :skills

  validates :title, length: { maximum: 128 }

  def skills_complete_for(user)
    skills.marked_as(:complete, :by => user).count
  end

  def score_for(user)
    score = 0
    task_count = tasks.marked_as(:complete, :by => user).count
    skill_count = skills.marked_as(:complete, :by => user).count
    score += task_count * Task.points_for_completion
    score += skill_count * Skill.points_for_completion
  end
end
