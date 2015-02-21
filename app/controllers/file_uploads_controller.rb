class FileUploadsController < ApplicationController
  include ReturnsLayoutlessAjax

  before_filter :authenticate_user!


  def new
    @task = Task.find(params[:task_id])
    @skill = Skill.find(params[:skill_id])

    @component = FileUpload.new
  end

  def create
    task = Task.find(params[:task_id])
    skill = Skill.find(params[:skill_id])

    file_upload = FileUpload.new(file_upload_params)
    task_component = task.task_components.create(:component => file_upload)
    task_component.positioning = params[:component_position]

    task.save!

    flash['success'] = 'Saved!'

    redirect_to([skill, task])
  end


  private

  def file_upload_params
    params.require(:file_upload).permit(:title, :description, :file)
  end
end
