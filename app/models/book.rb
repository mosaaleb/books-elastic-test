# frozen_string_literal: true

class Book < ApplicationRecord
  enum status: { unread: 0, currently_reading: 1, read: 2 }
  # validations
  validates :title, :description, :cover, presence: true
  validates :isbn, :isbn13,
            format: { with: /\A(97(8|9))?\d{9}(\d|X)\z/ },
            presence: true

  # association
  belongs_to :author
  has_many :book_additions, dependent: :destroy
  has_many :shelves, through: :book_additions
  has_one_attached :cover, dependent: :destroy
end
