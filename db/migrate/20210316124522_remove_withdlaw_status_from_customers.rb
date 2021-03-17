class RemoveWithdlawStatusFromCustomers < ActiveRecord::Migration[5.2]
  def change
    remove_column :customers, :withdlaw_status, :boolean
  end
end
