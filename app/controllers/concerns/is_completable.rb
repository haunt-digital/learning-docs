module IsCompletable
  extend ActiveSupport::Concern

  def record_completion(item, context)
    current_user.set_mark :complete, item
    flash['success'] = 'Task completed!'
    notify_add_points item
    update_context_completion_status context
  end

  def remove_completion(item, context)
    current_user.remove_mark :complete, item
    update_context_completion_status context
  end

  def update_context_completion_status(context)
    context.collections_complete_for?(current_user)

    if context.collections_complete_for?(current_user)
      current_user.set_mark :complete, context
      notify_add_points context
      flash['success'] = "#{context.class.completion_type_name} completed!"
    else
      current_user.remove_mark :complete, context
    end
  end
end
