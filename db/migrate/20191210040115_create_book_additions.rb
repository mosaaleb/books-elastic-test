# frozen_string_literal: true

class CreateBookAdditions < ActiveRecord::Migration[6.0]
  def change
    create_table :book_additions do |t|
      t.references :shelf, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
