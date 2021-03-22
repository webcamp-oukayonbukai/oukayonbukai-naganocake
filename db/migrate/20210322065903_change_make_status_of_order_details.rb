class ChangeMakeStatusOfOrderDetails < ActiveRecord::Migration[5.2]
  def up
    change_column :order_details, :make_status, :integer, default: 0, null: false
  end

  def down
    change_column :order_details, :make_status, :integer
  end
end
