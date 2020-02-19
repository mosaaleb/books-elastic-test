# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    username { Faker::Internet.username }
    password { Faker::Internet.password(min_length: 6) }
    association :shelf, strategy: :build
  end
end
