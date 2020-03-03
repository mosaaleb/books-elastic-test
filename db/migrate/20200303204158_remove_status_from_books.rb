# frozen_string_literal: true

class RemoveStatusFromBooks < ActiveRecord::Migration[6.0]
  def change
    remove_column :books, :status, :boolean
  end
end
