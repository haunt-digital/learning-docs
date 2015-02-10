class TasksController < ApplicationController
  include LayoutlessAjax

  def show
    # Scope by user eventually?
    @task = Task.find(params[:id])
    @skill = Skill.find(params[:skill_id])
  end

  def mark_complete
    @task = Task.find(params[:id])
    @skill = Skill.find(params[:skill_id])

    record_completion @task, @skill

    add_client_next_redirect @task, @skill

    flash['success'] = 'Task completed!'
    render partial: 'status', object: @task, as: :task
  end

  def mark_for_redo
    @task = Task.find(params[:id])
    @skill = Skill.find(params[:skill_id])

    remove_completion @task, @skill

    flash['warning'] = 'Task marked as todo'
    render partial: 'status', object: @task, as: :task
  end


  private


  def next_in_context_of(task, skill)
    task.next_in_context_of(skill, current_user)
  end

  def record_completion(task, skill)
    current_user.set_mark :complete, task
    update_parent_status skill
  end

  def remove_completion(task, skill)
    current_user.remove_mark :complete, task
    update_parent_status skill
  end

  def update_parent_status(skill)
    complete_tasks = skill.tasks.marked_as :complete, :by => current_user

    if complete_tasks.count == skill.tasks.count
      current_user.set_mark :complete, skill
    else
      current_user.remove_mark :complete, skill
    end
  end


  def add_client_next_redirect(task, skill)
    flash['notice'] = 'On to the next one...'

    client_redirect(
      skill_task_path(skill, next_in_context_of(task, skill))
    )
  end
end
