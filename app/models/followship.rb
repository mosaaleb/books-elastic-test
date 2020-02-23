# frozen_string_literal: true

class Followship < ApplicationRecord
  # associations
  belongs_to :user
  belongs_to :author

  # validations
  validates :user, uniqueness: { scope: :author_id }
end
