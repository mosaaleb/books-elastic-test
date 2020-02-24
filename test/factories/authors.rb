# frozen_string_literal: true

FactoryBot.define do
  factory :author do
    name { Faker::Book.author }

    factory :author_with_followers do
      transient do
        followers_count { 5 }
      end

      after :create do |author, evaluator|
        create_list(:followship, evaluator.followers_count, author: author)
      end
    end
  end
end
