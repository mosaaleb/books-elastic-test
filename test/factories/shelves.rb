# frozen_string_literal: true

FactoryBot.define do
  factory :shelf do
    association :user, strategy: :build
  end
end
