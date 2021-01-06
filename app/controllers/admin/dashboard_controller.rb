class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["AUTHENTICATION_USER"], password: ENV["AUTHENTICATION_PASSWORD"], if: -> { ENV["AUTHENTICATION_PASSWORD"].present?}

  def show
  end
end
