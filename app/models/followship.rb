# frozen_string_literal: true

class Followship < ApplicationRecord
  # associations
  belongs_to :user, counter_cache: :followings_count
  belongs_to :author, counter_cache: :followers_count

  # validations
  validates :user, uniqueness: { scope: :author_id }
end
