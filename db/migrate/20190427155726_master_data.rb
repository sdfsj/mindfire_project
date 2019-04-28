class MasterData < ActiveRecord::Migration[5.1]
  def change
    create_table :products_suppliers do |t|
      ## Database authenticatable
      t.integer :product_id,               null: false
      t.string :product_title,              null: false
      t.integer :supplier_id, null: false
      t.string :supplier_name, null: false
      t.float :price, null: false
      t.string :category, null: false, default: ""
      t.integer :is_active, null: false
      t.timestamps null: false
    end

    add_index :products_suppliers, :supplier_id
  end
end
