class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["AUTHENTICATION_USER"], password: ENV["AUTHENTICATION_PASSWORD"]

  def show
    @num_products = Product.count
    @num_category = Category.count
    @num_orders = Order.count
  end
end
