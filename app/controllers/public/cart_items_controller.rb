class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items.all
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_items = current_customer.cart_items.all
      if @cart_item.quantity != nil
        @cart_items.each do |cart_item|
          if cart_item.item_id == @cart_item.item_id
            new_quantity = cart_item.quantity + @cart_item.quantity
            cart_item.update_attribute(:quantity, new_quantity)
            @cart_item.delete
          end
        end
      end
    @cart_item.save
    redirect_to cart_items_path
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(quantity: params[:cart_item][:quantity].to_i)
    if @cart_item
      redirect_to cart_items_path
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
      redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all # destroy_allはメソッドらしい。
    redirect_to cart_items_path
  end

  private
    def cart_item_params
      params.require(:cart_item).permit(:item_id, :quantity)
    end
end