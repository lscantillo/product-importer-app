FactoryBot.define do
  factory :product do
    name { "MyText" }
    price { 1.5 }
    expiration { "MyText" }
    currency { nil }
  end
end
