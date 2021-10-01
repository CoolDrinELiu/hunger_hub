class HomeController < ApplicationController
  skip_before_action :require_login
  def index
    @records = Food.valid
  end
end