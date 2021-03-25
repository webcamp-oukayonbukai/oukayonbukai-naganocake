class Admin::OrderDetailsController < ApplicationController

  def update
    @order = Order.find(params[:order_id])
    @order_detail = OrderDetail.find(params[:id])
    if @order_detail.update(order_detail_params) && @order_detail.in_production?
        @order.in_production!
    else
      count = 0
      @order.order_details.each do |order_detail|
        if order_detail.complete?
          count +=1
        end
      end
      if count == @order.order_details.size
        @order.preparing_shipment!
      end
    end
      redirect_to admin_order_path(@order)
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:make_status)
  end
end

