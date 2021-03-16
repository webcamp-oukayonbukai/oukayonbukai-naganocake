class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :shipping_cost
      t.integer :pay_type
      t.integer :total_price
      t.string :address
      t.string :postcode
      t.string :name
      t.integer :buy_status

      t.timestamps
    end
  end
end
