class Admin::ItemsController < ApplicationController
  
  def index
    @items = Item.page(params[:page]).per(10)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item.id)
    else
      @item = Item.new
      render :new
    end
  end


  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path,  notice: "You have updated genre successfully."
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :image, :price, :sale_status, :genre_id)
  end
end
