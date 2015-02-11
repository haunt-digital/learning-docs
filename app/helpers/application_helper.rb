module ApplicationHelper
  def truncate(html, count = 15)
    TypoHero.truncate(html, count)
  end

  def complete?(obj)
    obj.completed_by?(current_user)
  end

  def mark_safe_cache_key(obj, suffix = 'general')
    user_stamp = "#{current_user.id}-#{current_user.mark_stamp}"
    obj_stamp = "#{obj.class}-#{obj.id}-#{obj.updated_at}"
    "#{user_stamp}-#{obj_stamp}-#{suffix}"
  end
end
