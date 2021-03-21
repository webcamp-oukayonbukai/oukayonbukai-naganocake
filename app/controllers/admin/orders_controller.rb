class Admin::OrdersController < ApplicationController
  def show
    @orders = Order.page(params[:page]).per(10)
  end

  def update
  end
end
