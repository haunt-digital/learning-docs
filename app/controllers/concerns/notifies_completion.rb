module NotifiesCompletion
  extend ActiveSupport::Concern

    def notify_points_for_completing(obj)
      type_name = obj.class.completion_type_name.downcase
      points = obj.class.points_for_completion
      flash[type_name + '_points'] = "+#{points} for completing #{type_name}"
    end

    def notify_completion_of(obj)
      type_name = obj.class.completion_type_name.downcase
      points = obj.class.points_for_completion
      flash[type_name + '_complete'] = "#{type_name.titlecase} completed!"
    end
end
