class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.string :image
      t.boolean :sale_status

      t.timestamps
    end
  end
end
