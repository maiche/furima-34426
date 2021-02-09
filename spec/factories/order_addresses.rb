FactoryBot.define do
  factory :order_address do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code { '123-4567' }
    prefecture_id { 2 }
    district { '横浜市' }
    address_code { '青山1-1' }
    building { '東京ハイツ' }
    telephone { '09012345678' }
  end
end
