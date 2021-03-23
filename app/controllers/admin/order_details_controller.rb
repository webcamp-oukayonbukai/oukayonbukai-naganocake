class Admin::OrderDetailsController < ApplicationController

  def update
    @order = Order.find(params[:order_id])
    @order_detail = @order.order_details.find(params[:id])
    if @order_detail.update(order_detail_params)
      redirect_to admin_order_path(@order)
    else
      render [:order][:show]
    end
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:make_status)
  end
end

