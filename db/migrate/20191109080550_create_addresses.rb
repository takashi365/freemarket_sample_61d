class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :post_code
      t.integer :prefectures
      t.string :city
      t.string :address
      t.string :after_address
      t.string :phone_number
      t.timestamps
    end
  end
end
