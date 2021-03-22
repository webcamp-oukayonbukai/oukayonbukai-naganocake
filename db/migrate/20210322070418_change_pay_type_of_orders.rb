class ChangePayTypeOfOrders < ActiveRecord::Migration[5.2]
  def up
    change_column :orders, :pay_type, :integer, default: 0, null: false
  end

  def down
    change_column :orders, :pa, :integer
  end
end
