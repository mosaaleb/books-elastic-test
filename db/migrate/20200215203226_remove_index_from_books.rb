# frozen_string_literal: true

class RemoveIndexFromBooks < ActiveRecord::Migration[6.0]
  def change
    remove_reference :books, :author, index: true
  end
end
