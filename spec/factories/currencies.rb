# frozen_string_literal: true

FactoryBot.define do
  factory :currency do
    name { Faker::Currency.name }
    currency_code { Faker::Currency.code }
  end
end
