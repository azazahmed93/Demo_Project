class ChangeRatingFromMovies < ActiveRecord::Migration
  def change
    change_column  :movies, :rating, USING rating::integer
  end
end
