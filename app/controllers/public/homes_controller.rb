class Public::HomesController < ApplicationController
  def top
    @items = Item.limit(4).order("created_at")
    @genres = Genre.all
  end

  def about
  end
end
