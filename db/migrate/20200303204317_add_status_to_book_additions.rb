# frozen_string_literal: true

class AddStatusToBookAdditions < ActiveRecord::Migration[6.0]
  def change
    add_column :book_additions, :status, :integer, default: 0
  end
end
