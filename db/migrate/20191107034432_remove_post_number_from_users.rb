class RemovePostNumberFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :post_number, :integer
    add_column :users, :year, :integer, null: false
    add_column :users, :month, :integer, null: false
    add_column :users, :day, :integer, null: false
  end
end
