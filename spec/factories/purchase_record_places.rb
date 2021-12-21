FactoryBot.define do
  factory :purchase_record_place do
    postal_code { '123-4567' }
    prefectures_id { 2}
    city { '東京都' }
    address { '1-1' }
    building_name { '東京ハイツ' }
    telephone_number { '12345678901' }
    token {"tok_abcdefghijk00000000000000000"}
    product_id { 1 }
    association :user
    
  end
end
