class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order
  
  enum make_status: { 
    cannot_start: 0, #製作不可 
    waiting_start: 1, #製作待ち
    in_production: 2, #製作中
    complete: 3, #製作完了
    }
  
end
