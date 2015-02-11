module ManagesSubscription
  extend ActiveSupport::Concern

  def record_subscription(item)
    current_user.set_mark :subscribed, item
    flash['success'] = "Subscribed to #{item.title} #{item.class.subscription_type_name.downcase}"
  end

  def remove_subscription(item)
    current_user.remove_mark :subscribed, item
    flash['notice'] = "Unbscribed from #{item.title} #{item.class.subscription_type_name.downcase}"
  end
end
