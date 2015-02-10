module SkillsHelper
  def complete?(skill)
    skill.marked_as? :complete, :by => current_user
  end
end
