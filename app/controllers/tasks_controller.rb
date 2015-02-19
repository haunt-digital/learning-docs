class TasksController < ApplicationController
  include ReturnsLayoutlessAjax
  include ManagesCompletion
  include NotifiesCompletion
  include RedirectsLogicallyOnCompletion

  before_filter :authenticate_user!

  def show
    # Scope by user eventually?
    @task = Task.find(params[:id])
    @skill = Skill.find(params[:skill_id])
  end

  def complete
    @task = Task.find(params[:id])
    @skill = Skill.find(params[:skill_id])

    record_completion @task, @skill, @task.skills

    attempt_completion_redirect @task, @skill

    render partial: 'status', object: @task, as: :task
  end

  def redo
    @task = Task.find(params[:id])
    @skill = Skill.find(params[:skill_id])

    remove_completion @task, @skill, @task.skills

    render partial: 'status', object: @task, as: :task
  end
end
