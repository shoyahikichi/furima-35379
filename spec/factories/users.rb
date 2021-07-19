FactoryBot.define do
  factory :user do
    gimei = Gimei.name

    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    birthday              {Faker::Date.backward}
    first_name            {gimei.first.kanji}
    family_name           {gimei.last.kanji}
    first_name_kana       {gimei.first.katakana}
    family_name_kana      {gimei.last.katakana}
  end
end