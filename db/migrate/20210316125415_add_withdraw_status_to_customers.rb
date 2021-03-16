class AddWithdrawStatusToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :withdraw_status, :boolean
  end
end
