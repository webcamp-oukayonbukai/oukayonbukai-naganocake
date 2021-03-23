class Order < ApplicationRecord
  has_many :order_details
  belongs_to :customer

  enum pay_type: {
    creditcard: 0, #クレジットカード
    bank: 1, #銀行振込
  }

  enum buy_status: {
    waiting_deposit: 0, #入金待ち
    confirm_deposit: 1, #入金確認
    in_production: 2, #製作中
    preparing_shipment: 3, #発送準備中
    shipped: 4, #発送済み
  }

  def shipping_cost
    800
  end

  def cal_price(customer)
 	  shipping_cost + customer.cart_items.sum(&:subtotal)
  end
  
  
  
end
