class AddColumnsInUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :admin, :boolean, default: true
  end
end
