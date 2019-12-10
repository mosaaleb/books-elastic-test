# frozen_string_literal: true

class BookAddition < ApplicationRecord
  belongs_to :shelf
  belongs_to :book
end
