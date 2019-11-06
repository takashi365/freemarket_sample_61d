class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.integer :status
      t.integer :prefecture
      t.integer :expense
      t.integer :shipping_method
      t.integer :arrival_date
      t.timestamps
    end
  end
end
