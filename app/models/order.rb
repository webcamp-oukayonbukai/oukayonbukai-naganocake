class Order < ApplicationRecord
  has_many :order_details
  belongs_to :customer
  
  enum buy_status: { wait: 0, check: 1, making: 2, prepare: 3, sent: 4 }
  
end
