class TasksController < ApplicationController
  include ReturnsLayoutlessAjax
  include ManagesCompletion
  include NotifiesCompletionPoints
  include RedirectsLogicallyOnCompletion

  def show
    # Scope by user eventually?
    @task = Task.find(params[:id])
    @skill = Skill.find(params[:skill_id])
  end

  def mark_complete
    @task = Task.find(params[:id])
    @skill = Skill.find(params[:skill_id])

    record_completion @task, @skill

    attempt_completion_redirect @task, @skill

    render partial: 'status', object: @task, as: :task
  end

  def mark_for_redo
    @task = Task.find(params[:id])
    @skill = Skill.find(params[:skill_id])

    remove_completion @task, @skill

    render partial: 'status', object: @task, as: :task
  end
end
