class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items
  has_many :order_details
  
  attachment :image
  enum sale_status: { true:1, false:2 }
  
  
end
