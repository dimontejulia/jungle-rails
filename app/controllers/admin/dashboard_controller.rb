class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["AUTHENTICATION_USER"], password: ENV["AUTHENTICATION_PASSWORD"]

  def show
  end
end
