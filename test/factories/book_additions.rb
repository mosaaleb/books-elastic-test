# frozen_string_literal: true

FactoryBot.define do
  factory :book_addition do
    association :book, strategy: :build
    association :shelf, strategy: :build
  end
end
