class TasksController < ApplicationController
  include LayoutlessAjax

  def show
    # Scope by user eventually?
    @task = Task.find(params[:id])
  end

  def complete
    @task = Task.find(params[:id])
    current_user.set_mark :complete, @task
    flash[:success] = 'Task completed :D'
    render :nothing => true
  end
end
