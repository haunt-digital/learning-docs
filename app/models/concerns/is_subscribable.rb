module IsSubscribable
  extend ActiveSupport::Concern

  included do
    markable_as :subscribed
  end


  module ClassMethods
    def subscription_type_name(name)
      define_singleton_method(:subscription_type_name) do
        name
      end
    end
  end


  def subscribed_by?(user)
    marked_as? :subscribed, :by => user
  end

  def subscribed_date_for(user)
    mark = Markable::Mark.where(marker: user, markable: self, mark: 'subscribed').first
    mark.created_at
  end
end
