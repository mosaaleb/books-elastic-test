# frozen_string_literal: true

class Book < ApplicationRecord
  enum status: { unread: 0, currently_reading: 1, read: 2 }
  # validations
  validates :title, :description, :isbn, :cover, presence: true
  # regex isbn ^(?=(?:\D*\d){10}(?:(?:\D*\d){3})?$)[\d-]+$

  # association
  has_one_attached :cover, dependent: :destroy
  has_many :book_additions, dependent: :destroy
  has_many :shelves, through: :book_additions

  # instance methods
  # def sthumbnail
  #   cover.variant(resize_to_fit: [300, 200])
  # end
end
