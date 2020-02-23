# frozen_string_literal: true

FactoryBot.define do
  factory :followship do
    association :user, strategy: :build
    association :author, strategy: :build
  end
end
