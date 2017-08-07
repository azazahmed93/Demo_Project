class ChangeRatingFromMovies < ActiveRecord::Migration
  def change
    change_column  :movies, :rating, 'integer USING CAST(rating AS integer)'
  end
end
