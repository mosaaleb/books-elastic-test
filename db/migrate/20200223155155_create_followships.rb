# frozen_string_literal: true

class CreateFollowships < ActiveRecord::Migration[6.0]
  def change
    create_table :followships do |t|
      t.references :author, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :followships, %i[user_id author_id], unique: true
  end
end
