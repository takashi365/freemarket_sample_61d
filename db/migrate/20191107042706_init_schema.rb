class InitSchema < ActiveRecord::Migration[5.2]
  def up
    create_table "items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.string "name"
      t.text "description"
      t.integer "price"
      t.integer "status"
      t.integer "prefecture"
      t.integer "expense"
      t.integer "shipping_method"
      t.integer "arrival_date"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
    create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.string "email", default: "", null: false
      t.string "encrypted_password", default: "", null: false
      t.string "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.string "nickname", null: false
      t.string "family_name_kanji", null: false
      t.string "family_name_kana", null: false
      t.string "first_name_kanji", null: false
      t.string "first_name_kana", null: false
      t.integer "year", null: false
      t.integer "month", null: false
      t.integer "day", null: false
      t.index ["email"], name: "index_users_on_email", unique: true
      t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "The initial migration is not revertable"
  end
end
