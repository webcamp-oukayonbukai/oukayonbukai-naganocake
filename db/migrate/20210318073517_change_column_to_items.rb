class ChangeColumnToItems < ActiveRecord::Migration[5.2]
  def up
    change_column :items, :sale_status, :boolean, default: true
  end

  def down
    change_column :items, :sale_status, :boolean
  end
end
