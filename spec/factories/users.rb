FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    email                 {"tt@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    family_name_kanji     {"田中"}
    family_name_kana      {"タナカ"}
    first_name_kanji      {"一郎"}
    first_name_kana       {"イチロー"}
    year                  {"1986"}
    month                 {"9"}
      day                 {"25"}
  end

end