module ManagesCompletion
  extend ActiveSupport::Concern

  def record_completion(item, context)
    current_user.set_mark :complete, item
    flash['success'] = "#{item.class.completion_type_name} completed!"

    if self.respond_to?(:notify_completion_add_points)
      notify_completion_add_points item
    end

    update_context_completion_status context
  end

  def remove_completion(item, context)
    current_user.remove_mark :complete, item
    flash['warning'] = "#{item.class.completion_type_name} marked as todo"

    update_context_completion_status context
  end

  def update_context_completion_status(context)
    if context.collections_are_complete_for?(current_user)
      current_user.set_mark :complete, context
      if self.respond_to?(:notify_completion_add_points)
        notify_completion_add_points context
      end
      flash['success'] = "#{context.class.completion_type_name} completed!"
    else
      current_user.remove_mark :complete, context
    end
  end
end
