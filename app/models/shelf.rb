# frozen_string_literal: true

class Shelf < ApplicationRecord
  # associations
  belongs_to :user
  has_many :book_additions, dependent: :destroy
  has_many :books, through: :book_additions
end
