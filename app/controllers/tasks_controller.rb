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

    current_user.set_mark :complete, @task

    flash['success'] = 'Task completed :D'

    next_task = @task.next_in_context_of(@skill, current_user)

    if next_task
      flash['notice'] = 'On to the next one...'

      client_redirect(
        skill_task_path(@skill, next_task)
      )
    end

    render partial: 'status', object: @task, as: :task
  end

  def mark_redo
    @task = Task.find(params[:id])
    @skill = Skill.find(params[:skill_id])

    current_user.remove_mark :complete, @task

    flash['warning'] = 'Task marked todo'
    render partial: 'status', object: @task, as: :task
  end
end
