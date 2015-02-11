module RelaysCollectionCompleteness
  extend ActiveSupport::Concern

  module ClassMethods
    def relays_completeness_for_collections(*args)
      define_method(:completable_types) do
        args
      end

      args.each do |type|
        define_method("#{type}_complete_for".to_sym) do |user|
          send(type).marked_as(:complete, :by => user).count
        end
      end
    end
  end


  def collections_completion_score_for(user, flat = false)
    score = 0
    completable_types.each do |type|
      count = send(type).marked_as(:complete, :by => user).count
      unless count < 1
        score += count * send(type).points_for_completion
      end
    end

    score
  end


  def collections_possible_score
    score = 0
    completable_types.each do |type|
      count = send(type).count
      unless count < 1
        score += count * send(type).points_for_completion
      end
    end

    score
  end


  def collections_are_complete_for?(user)
    complete = false
    completable_types.each do |type|
      total_count = send(type).count
      complete_count = send(type).marked_as(:complete, :by => user).count

      complete = true

      unless complete_count == total_count
        complete = false
      end
    end

    complete
  end
end
