class Movie < ActiveRecord::Base
  has_many :posters, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :appearances
  has_many :actors , through: :appearances, dependent: :destroy

  validates :title, :plot, :genre, :year, presence: true

  accepts_nested_attributes_for :posters, allow_destroy: true
  accepts_nested_attributes_for :appearances, allow_destroy: true

  scope :latest_movies,    -> { order(year: :desc) }
  scope :featured_movies,  -> { where(featured: true) }
  scope :top_movies,       -> { order(rating: :desc) }
  scope :ordered,          -> { order(created_at: :desc) }

  ratyrate_rateable 'rating'

  paginates_per 8

  RECORDS_LIMIT = 4

  def youtube_id
    self.url.split('/').last if self.url
  end

  def self.fetch_movies(params)
    movies =  case params[:type]
              when 'latest' then Movie.latest_movies.unscope(:limit)
              when 'featured' then Movie.featured_movies.unscope(:limit)
              when 'top' then Movie.top_movies.unscope(:limit)
              else Movie.ordered
              end

    movies.page(params[:page])
  end
end
