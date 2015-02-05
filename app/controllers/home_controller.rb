class HomeController < ApplicationController
  def index
    flash[:success] = current_user.email if current_user
  end
end
