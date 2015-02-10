module ApplicationHelper
  def truncate(html, count = 15)
    TypoHero.truncate(html, count)
  end

  def complete?(obj)
    obj.completed_by?(current_user)
  end
end
