module CompetenciesHelper
  def skill_completion(competency)
    complete = competency.skills_complete_for(current_user)
    total = competency.skills.count
    "#{complete} of #{total}"
  end

  def score(competency)
    competency.collections_completion_score_for(current_user)
  end
end
