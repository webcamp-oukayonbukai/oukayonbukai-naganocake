class Order < ApplicationRecord
  has_many :order_details
  belongs_to :customer
  
  def item_price_total
    Item.all.sum(:subtotal)
  end
  
  def total_price
    
  end
  
end
