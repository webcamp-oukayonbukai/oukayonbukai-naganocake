class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items
  has_many :order_details
  
  attachment :image
  
  def tax_price
    (price * 1.1).ceil
  end
end