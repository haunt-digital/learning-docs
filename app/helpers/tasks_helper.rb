module TasksHelper
  def current?(task)
    unless defined? @task
      return false
    end

    @task.id == task.id
  end
end
