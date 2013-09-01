FactoryGirl.define do
  factory :thred do
    title { Faker::Name.name }

    factory :thred_with_posts do
      ignore do
        entry_count 3
      end

      after(:create) do |thred, evaluator|
        create_list(:post, evaluator.entry_count, thred:thred)
      end
    end
  end

  factory :post do
    title { "#{Faker::Company.name} #{Faker::Company.bs}" }
    link { Faker::Internet.http_url }
    start Date.today
  end
end
