class AddUniqueIndexToFavorites < ActiveRecord::Migration
  def change
    add_index :favorites, [:movie_id, :user_id], unique: true
  end
end
