class SkillsController < ApplicationController
  include ReturnsLayoutlessAjax

  def show
    # Scope by user eventually?
    @skill = Skill.find(params[:id])
  end
end
