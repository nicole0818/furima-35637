FactoryBot.define do
  factory :user do
    nickname {"test"}
    email {"test@gmail.com"}
    password{"test0818"}
    password_confirmation{"test0818"}
    last_name_kanji{"田中"}
    first_name_kanji{"一朗"}
    last_name_kana{"タナカ"}
    first_name_kana{"イチロウ"}
    birthday{"19300823"}
    
  end
end