class CompetenciesController < ApplicationController
  include ReturnsLayoutlessAjax
  include ManagesSubscription

  before_filter :authenticate_user!

  def show
    # Scope by user eventually?
    @competency = Competency.find(params[:id])
  end

  def subscribe
    @competency = Competency.find(params[:id])
    record_subscription @competency
    render partial: 'status', object: @competency, as: :competency
  end

  def unsubscribe
    @competency = Competency.find(params[:id])
    remove_subscription @competency
    render partial: 'subscribe', object: @competency, as: :competency
  end
end
