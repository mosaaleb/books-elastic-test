# frozen_string_literal: true

class BookAddition < ApplicationRecord
  enum status: { unread: 0, currently_reading: 1, read: 2 }

  enum is_approved: { unapproved: 'unapproved',
                      approved: 'approved',
                      approved_rejected: 'approved_rejected',
                      unapproved_rejected: 'unapproved_rejected' }

  belongs_to :book
  belongs_to :shelf

  validates :book, uniqueness: { scope: :shelf_id }
end
