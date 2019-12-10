# frozen_string_literal: true

class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :description
      t.string :isbn
      t.string :isbn13
      t.integer :edition
      t.boolean :status, null: false, default: 0

      t.timestamps
    end
    add_index :books, :isbn, unique: true
    add_index :books, :isbn13, unique: true
  end
end
