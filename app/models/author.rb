# frozen_string_literal: true

class Author < ApplicationRecord
  before_create :generate_slug
  has_many :books, dependent: :destroy
  has_many :followships,
           foreign_key: :author_id,
           inverse_of: :author,
           dependent: :destroy
  has_many :followers, through: :followships, source: :user
  # instance methods
  def to_param
    name
  end

  private

  def generate_slug
    name.downcase.tr(' ', '-')
  end
end
