class Public::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page]).per(8)
    @items_all = Item.all
  end

  def show
    @cart_item = CartItem.new
    @item = Item.find(params[:id])
  end
end
