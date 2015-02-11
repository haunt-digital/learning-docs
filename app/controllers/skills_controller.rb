class SkillsController < ApplicationController
  include ReturnsLayoutlessAjax

  before_filter :authenticate_user!

  def show
    # Scope by user eventually?
    @skill = Skill.find(params[:id])
  end
end
