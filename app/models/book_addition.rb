# frozen_string_literal: true

class BookAddition < ApplicationRecord
  belongs_to :book
  belongs_to :shelf

  validates :book, uniqueness: { scope: :shelf_id }
end
