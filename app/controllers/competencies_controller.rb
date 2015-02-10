class CompetenciesController < ApplicationController
  include LayoutlessAjax

  def show
    # Scope by user eventually?
    @competency = Competency.find(params[:id])
  end
end
