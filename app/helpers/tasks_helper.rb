module TasksHelper
  def complete?(task)
    task.marked_as? :complete, :by => current_user
  end
end
