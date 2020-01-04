# frozen_string_literal: true

class AddAuthorToBooks < ActiveRecord::Migration[6.0]
  def change
    add_reference :books, :author,
                  foreign_key: { to_table: :users },
                  index: true, null: false, default: ''
  end
end
