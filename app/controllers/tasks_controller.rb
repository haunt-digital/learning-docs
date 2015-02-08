class TasksController < ApplicationController
  include LayoutlessAjax

  def show
    # Scope by user eventually?
    @task = Task.find(params[:id])
  end

  def mark_complete
    @task = Task.find(params[:id])
    current_user.set_mark :complete, @task
    flash['success'] = 'Task completed :D'
    render partial: 'status', object: @task, as: :task
  end

  def mark_redo
    @task = Task.find(params[:id])
    current_user.remove_mark :complete, @task
    flash['warning'] = 'Task marked todo'
    render partial: 'status', object: @task, as: :task
  end
end
