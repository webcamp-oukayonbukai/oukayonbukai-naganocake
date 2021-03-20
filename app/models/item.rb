class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items, dependent: :destroy #(https://qiita.com/Tsh-43879562/items/fbc968453a7063776637)
  has_many :order_details
  
  attachment :image
  
end