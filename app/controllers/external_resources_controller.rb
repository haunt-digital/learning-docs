class ExternalResourcesController < ApplicationController
  include LayoutlessAjax

  def show
    # Scope by user eventually?
    @resource = ExternalResource.find(params[:id])
  end
end
