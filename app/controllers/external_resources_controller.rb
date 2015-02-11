class ExternalResourcesController < ApplicationController
  include ReturnsLayoutlessAjax

  before_filter :authenticate_user!


  def show
    # Scope by user eventually?
    @resource = ExternalResource.find(params[:id])
  end
end
