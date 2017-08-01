class Favorite < ActiveRecord::Base
  belongs_to :movie
  belongs_to :user

  validates :movie_id, uniqueness: true
end
