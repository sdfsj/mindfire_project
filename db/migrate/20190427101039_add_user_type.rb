class AddUserType < ActiveRecord::Migration[5.1]
  def change
  	add_column :users,:admin, :tinyint, null: false , default: 0
  end
end
