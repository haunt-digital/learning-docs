module RedirectsLogicallyOnCompletion
  extend ActiveSupport::Concern

  def attempt_completion_redirect(current_item, context)
    unless add_client_redirect_to_next(current_item, context)
      if context.marked_as? :complete, by: current_user
        add_client_redirect_to_context(context)
      end
    end
  end

  def next_in_context_of(current_item, context)
    current_item.next_in_context_of(context, current_user)
  end

  def add_client_redirect_to_next(current_item, context)
    next_item = next_in_context_of(current_item, context)

    if next_item
      flash['notice'] = 'On to the next one...'

      client_redirect(
        url_for([context, next_item])
      )
      return true
    end

    return false
  end

  def add_client_redirect_to_context(context)
    client_redirect(
      url_for(context)
    )
  end
end
