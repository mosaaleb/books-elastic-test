# frozen_string_literal: true

class Book < ApplicationRecord
  enum status: { unread: 0, currently_reading: 1, read: 2 }
  # validations
  validates :title, :description, :isbn, presence: true

  # association
  has_many :book_additions, dependent: :destroy
  has_many :shelves, through: :book_additions
end
