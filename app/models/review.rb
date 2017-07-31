class Review < ActiveRecord::Base
  has_many :reports, dependent: :destroy
  belongs_to :user
  belongs_to :movie

  validates :content, presence: true

  paginates_per 5

  scope :movie_reviews, -> (id){where(movie_id: id).order("created_at")}
end
