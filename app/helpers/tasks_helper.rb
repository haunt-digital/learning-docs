module TasksHelper
  def complete?(task)
    task.marked_as? :complete, :by => current_user
  end

  def current?(task)
    unless defined? @task
      return false
    end

    @task.id == task.id
  end
end
