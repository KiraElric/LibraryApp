class CreateJoinTableBookAuthor < ActiveRecord::Migration[5.2]
  def change
    create_join_table :books, :authors do |t|
      t.index [:book_id, :author_id] #Busqueda mas rapida en la bd, viene por defecto y solo habria que descomentarlas para usarlas
      t.index [:author_id, :book_id]
    end
  end
end
