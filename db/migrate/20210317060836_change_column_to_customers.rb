class ChangeColumnToCustomers < ActiveRecord::Migration[5.2]

  def up
    change_column :customers, :withdraw_status, :boolean, null: false, default: false
  end

  def down
    change_column :customers, :withdraw_status, :boolean
  end
end