class Admin::OrdersController < ApplicationController

  # GET /admin/orders/
  def index
    @orders = Order.all
  end

  # GET /admin/orders/
  def show
    @order = Order.find_by(id: params["id"])
  end

end
