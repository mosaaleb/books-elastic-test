# frozen_string_literal: true

class AddFollowersCounterCacheToAuthor < ActiveRecord::Migration[6.0]
  def change
    add_column :authors, :followers_count, :integer, null: false, default: 0
  end
end
