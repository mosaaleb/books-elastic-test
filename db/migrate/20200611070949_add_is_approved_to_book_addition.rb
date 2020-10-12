# frozen_string_literal: true

class AddIsApprovedToBookAddition < ActiveRecord::Migration[6.0]
  def change
    add_column :book_additions, :is_approved, :string, default: 'unapproved'
  end
end
