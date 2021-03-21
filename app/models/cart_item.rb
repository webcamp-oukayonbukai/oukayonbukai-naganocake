class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer

  validates :item_id, presence: true, uniqueness: { scope: :customer_id }
  
  def subtotal
    item.tax_price * quantity
  end
end
