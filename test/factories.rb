FactoryGirl.define do
  factory :thred do
    name { Faker::Name.name }

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
    url { Faker::Internet.http_url }
    date Date.today
  end
end
