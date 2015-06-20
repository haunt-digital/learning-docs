class HomeController < ApplicationController
  def index
    redirect_to competencies_path
  end
end
