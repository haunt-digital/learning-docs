class TextBlocksController < ApplicationController
  include ReturnsLayoutlessAjax

  before_filter :authenticate_user!

  def new
    @task = Task.find(params[:task_id])
    @skill = Skill.find(params[:skill_id])

    @component = TextBlock.new
  end


  def create
    task = Task.find(params[:task_id])
    skill = Skill.find(params[:skill_id])

    text_block = TextBlock.new(text_block_params)
    task_component = task.task_components.create(:component => text_block)
    task_component.positioning = params[:component_position]

    task.save!
    flash['success'] = 'Saved!'

    redirect_to([skill, task])
  end


  private

  def text_block_params
    params.require(:text_block).permit(:body)
  end
end
