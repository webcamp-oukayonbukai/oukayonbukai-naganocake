class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.integer :quantity
      t.integer :make_status
      t.integer :price

      t.timestamps
    end
  end
end
