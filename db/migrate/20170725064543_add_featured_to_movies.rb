class AddFeaturedToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :featured, :boolean
  end
end
