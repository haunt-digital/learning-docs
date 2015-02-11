module CompetenciesHelper
  def skill_completion(competency)
    complete = competency.skills_complete_for(current_user)
    total = competency.skills.count
    "#{complete} of #{total}"
  end

  def competency_score(competency)
    "#{competency.collections_completion_score_for(current_user)} pts"
  end

  def competency_percentage(competency)
    total = competency.tasks.count
    completed = competency.tasks_complete_for(current_user)
    percentage = completed.to_f / total.to_f * 100.0
    number_to_percentage(percentage, precision: 0)
  end

  def subscribed?(competency)
    competency.subscribed_by?(current_user)
  end
end
