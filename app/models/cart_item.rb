class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer
  
  validates :item_id, presence: true, uniqueness: { scope: :customer_id }
  #ネット参照必要かわからない(https://qiita.com/j-sunaga/items/d7f0e944baad6e56206c)
  
  def subtotal
		item.with_tax_price * amount
  end
end
