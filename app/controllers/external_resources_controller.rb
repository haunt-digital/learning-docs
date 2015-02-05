class ExternalResourcesController < ApplicationController
  include LayoutlessAjax

  def show
    @resource = ExternalResource.find(params[:id])
  end
end
