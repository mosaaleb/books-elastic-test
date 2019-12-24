# frozen_string_literal: true

class Book < ApplicationRecord
  enum status: { unread: 0, currently_reading: 1, read: 2 }
  # validations
  validates :title, :description, :cover, presence: true
  validates :isbn, :isbn13,
            format: { with: /\A(97(8|9))?\d{9}(\d|X)\Z/ },
            presence: true

  # association
  has_one_attached :cover, dependent: :destroy
  has_many :book_additions, dependent: :destroy
  has_many :shelves, through: :book_additions

  # instance methods
  # def thumbnail
  #   cover.variant(resize_to_fit: [300, 200])
  # end

  def cover_color
    # source = ImageProcessing::MiniMagick.source(cover).resize('1x1')
    # image = MiniMagick::Image.new
  end
end
