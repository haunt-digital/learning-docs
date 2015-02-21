class TaskComponentsController < ApplicationController
  include ReturnsLayoutlessAjax

  before_filter :authenticate_user!

  def new
    @task = Task.find(params[:task_id])
    @skill = Skill.find(params[:skill_id])
    @creatable_objects = creatable_objects
  end

  def creatable_objects
    TaskComponent.creatable_models.collect {|m| m.new() }
  end
end
