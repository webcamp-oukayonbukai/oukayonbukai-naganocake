class Order < ApplicationRecord
  has_many :order_details
  belongs_to :customer

  
  def item_price_total
    OrderDetail.all.sum(:subtotal)
  end
  
  def total_price
    order.shipping_cost + item_price_total
  end
  
end
