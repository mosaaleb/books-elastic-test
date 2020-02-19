# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    description { Faker::Lorem.paragraph }
    isbn { '1257561035' }
    isbn13 { '9783161484100' }
    cover do
      fixture_file_upload(Rails.root.join('spec/support/assets/test-image.jpg'))
    end
    association :author, strategy: :build
  end
end
