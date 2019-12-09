class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.references :publisher, null: false, foreign_key: true
      t.string :name
      t.string :author
      t.string :price

      t.timestamps
    end
  end
end
