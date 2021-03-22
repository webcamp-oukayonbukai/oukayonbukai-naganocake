class ChangeBuyStatusOfOrders < ActiveRecord::Migration[5.2]
  def up
    change_column :orders, :buy_status, :integer, default: 0, null: false
  end

  def down
    change_column :orders, :buy_status, :integer
  end
end

