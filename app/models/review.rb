class Review < ActiveRecord::Base
  has_many :reports, dependent: :destroy
  belongs_to :user
  belongs_to :movie

  paginates_per 5
end
