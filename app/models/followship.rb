# frozen_string_literal: true

class Followship < ApplicationRecord
  belongs_to :user
  belongs_to :author

  validates :user, uniqueness: { scope: :author_id }
end
