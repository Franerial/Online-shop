FactoryBot.define do
  factory :item do
    title { "MyString" }
    description { "MyText" }
    price { "9.99" }
    category

    trait :invalid do
      title { nil }
    end
  end
end
