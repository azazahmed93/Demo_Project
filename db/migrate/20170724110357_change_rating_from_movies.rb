class ChangeRatingFromMovies < ActiveRecord::Migration
  def change
    change_column  :movies, :rating, :float
  end
end
