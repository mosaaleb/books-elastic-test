# frozen_string_literal: true

class Book < ApplicationRecord
  enum status: { unread: 0, currently_reading: 1, read: 2 }
  belongs_to :publisher
  belongs_to :user
end
