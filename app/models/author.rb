# frozen_string_literal: true

class Author < ApplicationRecord
  before_create :generate_slug
  has_many :books, dependent: :destroy

  # instance methods
  def to_param
    name
  end

  private

  def generate_slug
    name.downcase.tr(' ', '-')
  end
end
