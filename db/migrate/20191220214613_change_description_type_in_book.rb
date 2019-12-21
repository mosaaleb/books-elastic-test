# frozen_string_literal: true

class ChangeDescriptionTypeInBook < ActiveRecord::Migration[6.0]
  def change
    change_column :books, :description, :text
  end
end
