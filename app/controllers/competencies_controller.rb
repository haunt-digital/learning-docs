class CompetenciesController < ApplicationController
  include ReturnsLayoutlessAjax

  def show
    # Scope by user eventually?
    @competency = Competency.find(params[:id])
  end
end
