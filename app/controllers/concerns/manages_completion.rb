module ManagesCompletion
  extend ActiveSupport::Concern

  def record_completion(item, context, parents)
    current_user.set_mark :complete, item

    trigger_completion_notifications item

    refresh_completion_statuses(context, parents)
  end


  def remove_completion(item, context, parents)
    current_user.remove_mark :complete, item
    flash['warning'] = "#{item.class.completion_type_name} marked as todo"

    refresh_completion_statuses(context, parents)
  end


  def refresh_completion_statuses(context, parents)
    refresh_context_completion_status context
    refresh_parent_completion_statuses parents
  end


  def refresh_context_completion_status(context)
    update_parent_completion_status context
  end


  def refresh_parent_completion_statuses(parents)
    parents.each do |item|
      update_parent_completion_status item, :silent
    end
  end


  def update_parent_completion_status(item, silent = nil)
    if item.collections_are_complete_for?(current_user)
      current_user.set_mark :complete, item

      unless silent
        trigger_completion_notifications item
      end
    else
      current_user.remove_mark :complete, item
    end
  end


  def trigger_completion_notifications(item)
    if self.respond_to?(:notify_completion_of)
      notify_completion_of item
    end

    if self.respond_to?(:notify_points_for_completing)
      notify_points_for_completing item
    end
  end
end
