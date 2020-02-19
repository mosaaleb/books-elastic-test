# frozen_string_literal: true

class BookAddition < ApplicationRecord
  enum status: { unread: 0, currently_reading: 1, read: 2 }

  # validations
  validates :book, uniqueness: { scope: :shelf_id }

  # associations
  belongs_to :book
  belongs_to :shelf
end
