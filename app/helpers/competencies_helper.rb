module CompetenciesHelper
  def subscribed?(competency)
    competency.subscribed_by?(current_user)
  end

  def skill_completion(competency)
    complete = competency.skills_complete_for(current_user)
    total = competency.skills.count
    ratio = complete.to_f / total.to_f

    if ratio.between?(0.8, 1)
      badge_class = 'success'
    elsif ratio.between?(0.3, 0.8)
      badge_class = 'notice'
    else
      badge_class = 'alert'
    end

    "<span class='badge-#{badge_class}'>#{complete} of #{total} skills</span>".html_safe
  end

  def competency_score(competency)
    score = competency.collections_completion_score_for(current_user)

    if score > (200)
      badge_class = 'success'
    elsif score.between?(80, 200)
      badge_class = 'notice'
    else
      badge_class = 'alert'
    end

    "<span class='badge-#{badge_class}'>#{competency.collections_completion_score_for(current_user)} pts</span>".html_safe
  end

  def competency_percentage(competency)
    total = competency.tasks.count
    completed = competency.tasks_complete_for(current_user)
    percentage = completed.to_f / total.to_f * 100.0

    if percentage.between?(80, 100)
      badge_class = 'success'
    elsif percentage.between?(30, 80)
      badge_class = 'notice'
    else
      badge_class = 'alert'
    end

    "<span class='badge-#{badge_class}'>#{number_to_percentage(percentage, precision: 0)}</span>".html_safe
  end

end
