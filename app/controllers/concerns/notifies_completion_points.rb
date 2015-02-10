module NotifiesCompletionPoints
  extend ActiveSupport::Concern

    def notify_completion_add_points(obj)
      type_name = obj.class.completion_type_name.downcase
      points = obj.class.points_for_completion
      flash[type_name + '_points'] = "+#{points} for completing #{type_name}"
    end
end
