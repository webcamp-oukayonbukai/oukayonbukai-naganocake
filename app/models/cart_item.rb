class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer
  validates :quantity, presence: true

 def subtotal
   self.item.tax_price * self.quantity
 end
end
