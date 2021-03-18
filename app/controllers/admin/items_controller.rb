class Admin::ItemsController < ApplicationController
  def index

  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(genre_params)
    # @image = Image.new(genre_params)
    if @item.save
      # @image.save
      redirect_to admin_item_path, notice: "You have created item successfully."
    else
      @item = Item.new
      # @image = Image.new
      render :new
    end
  end


  def show
  end

  def edit
  end

  def update

  end

  private

  def image_params
    params.require(:item).permit(:image)
  end
end
