class HomeController < ApplicationController
  def index
    flash[:success] = "Hi there!"
  end
end
