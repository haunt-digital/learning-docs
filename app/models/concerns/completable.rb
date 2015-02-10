module Completable
  extend ActiveSupport::Concern

  included do
    markable_as :complete
  end

  module ClassMethods
    def points_for_completion(points)
      define_singleton_method(:points_for_completion) do
        points
      end
    end

    def completion_type_name(name)
      define_singleton_method(:completion_type_name) do
        name
      end
    end
  end

  def completed_by?(user)
    marked_as? :complete, :by => user
  end

  def completion_date_for(user)
    mark = Markable::Mark.where(marker: user, markable: self).first
    mark.created_at
  end
end
