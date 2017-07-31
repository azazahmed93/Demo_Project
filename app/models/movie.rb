class Movie < ActiveRecord::Base
  has_many :posters, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :appearances
  has_many :actors , through: :appearances, dependent: :destroy

  accepts_nested_attributes_for :posters, allow_destroy: true
  accepts_nested_attributes_for :appearances, allow_destroy: true

  validates :title, :plot, :genre, :year, presence: true

  ratyrate_rateable "rating"

  paginates_per 8

  scope :latest_movies, -> {order(year: :desc).limit(4)}
  scope :featured_movies, -> {where(featured: true).limit(4)}
  scope :top_movies, -> {order(rating: :desc).limit(4)}
  scope :curr_movie, -> (id){includes(:actors).find(id)}
  def youtube_id
    self.url.split('/').last if self.url
  end
end
