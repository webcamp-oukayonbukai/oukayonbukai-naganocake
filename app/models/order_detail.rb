class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to
  
  def subtotal
    (quantity * tax_price)
  end
end
