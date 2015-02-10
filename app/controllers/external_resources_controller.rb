class ExternalResourcesController < ApplicationController
  include ReturnsLayoutlessAjax

  def show
    # Scope by user eventually?
    @resource = ExternalResource.find(params[:id])
  end
end
