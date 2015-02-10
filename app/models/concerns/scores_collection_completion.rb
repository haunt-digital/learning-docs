module ScoresCollectionCompletion
  extend ActiveSupport::Concern


  module ClassMethods
    def scores_completion_for_collections(*args)
      define_method(:scorable_types) do
        args
      end
    end
  end

  def collections_completion_score_for(user)
    score = 0
    scorable_types.each do |type|
      count = send(type).marked_as(:complete, :by => user).count
      unless count < 1
        self.class.reflect_on_association(type).class_name
        score += count * send(type).points_for_completion
      end
    end

    score
  end
end
