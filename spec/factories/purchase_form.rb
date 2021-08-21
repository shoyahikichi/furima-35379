FactoryBot.define do
  factory :purchase_form do
    postal_code        { "091-1122" }
    prefecture_id      { Faker::Number.within(range: 2..48) }
    city               { "沖縄" }
    address            { "那覇1-1-1" }
    phone_number       { "09011223344" }
    building_name      { "那覇ビル" }
    purchase_id        { Purchase.create(user_id: user_id, item_id: item_id) }
    token              {"tok_abcdefghijk00000000000000000"}
  end
end