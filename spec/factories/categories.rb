FactoryBot.define do
  factory :category do
    title { "MyCategory" }

    transient do
      items_count { 3 }
    end

    factory :category_with_items do
      after(:create) do |category, evaluator|
        create_list(:item, evaluator.items_count, category: category)
      end
    end
  end
end
