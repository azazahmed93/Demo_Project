class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie
  paginates_per 5
end
