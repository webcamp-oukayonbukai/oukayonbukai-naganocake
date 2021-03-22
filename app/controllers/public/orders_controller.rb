class Public::OrdersController < ApplicationController
  # before_action :authenticate_customer!

  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items.all

    if params[:order][:address_status] == "0"
      @order.postcode = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address_status] == "1"
      address = Address.find(params[:order][:address_id])
      @order.postcode = address.postcode
      @order.address = address.address
      @order.name = address.name
    elsif params[:order][:address_status] == "2"
      @order.postcode = params[:order][:postcode]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    end
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.shipping_cost = 800
    @order.total_price = @order.cal_price(current_customer)
    if @order.save
        current_customer.cart_items.each do |cart_item|
          order_detail = OrderDetail.new
          order_detail.quantity = cart_item.quantity
          order_detail.price = cart_item.item.price
          order_detail.order_id = @order.id
          order_detail.item_id = cart_item.item_id
          order_detail.save
        end
        current_customer.cart_items.destroy_all
      redirect_to complete_orders_path
    else
      @order = Order.new
      render :new
    end
  end

  def index
    @orders = Order.all
  end

  def show
    @orders = Order.all
    @order = Order.find(params[:id])
  end
end

private

def order_params
  params.require(:order).permit(:pay_type, :postcode, :address, :name)
end
