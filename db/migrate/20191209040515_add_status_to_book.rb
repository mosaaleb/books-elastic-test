class AddStatusToBook < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :status, :integer, default: 0
  end
end
