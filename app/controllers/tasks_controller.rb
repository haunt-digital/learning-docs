class TasksController < ApplicationController
  include LayoutlessAjax

  def show
    # Scope by user eventually?
    @task = Task.find(params[:id])
  end
end
