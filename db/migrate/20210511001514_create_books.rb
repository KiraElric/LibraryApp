class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :isbn, null: false
      t.integer :stock, default: 0
      t.integer :edition_number, default: 1
      t.integer :genre, default: 0
      t.integer :language, default: 0
      t.integer :pages, default: 1
      t.references :publisher, foreign_key: true

      t.timestamps
    end
  end
end
