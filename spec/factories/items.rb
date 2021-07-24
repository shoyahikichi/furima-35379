FactoryBot.define do
  factory :item do
    name                     {Faker::Lorem.word}
    introduction             {Faker::Lorem.sentence}
    category_id              {Faker::Number.within(range: 2..11)}
    item_condition_id        {Faker::Number.within(range: 2..7)}
    postage_payer_id         {Faker::Number.within(range: 2..3)}
    prefecture_id            {Faker::Number.within(range: 2..48)}
    preparation_day_id       {Faker::Number.within(range: 2..4)}
    price                    {"9999"}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/output-image1.png'), filename: 'output-image1.png')
    end
  end
end
