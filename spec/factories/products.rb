# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    name { "Test #(#{Faker::Number.number(digits: 16)})" }
    price { Faker::Number.number(digits: 2) }
    expiration { Faker::Date.forward(days: 365) }
    currency { FactoryBot.create(:currency) }
  end
end
