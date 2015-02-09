class SkillsController < ApplicationController
  include LayoutlessAjax

  def show
    # Scope by user eventually?
    @skill = Skill.find(params[:id])
  end
end
