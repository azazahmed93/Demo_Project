class Movie < ActiveRecord::Base
  has_many :posters, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :appearances, dependent: :destroy
  has_many :actors, through: :appearances
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites
  belongs_to :user, class_name: 'User', foreign_key: :user_id
  validates :posters, presence: true

  accepts_nested_attributes_for :posters, allow_destroy: true
  accepts_nested_attributes_for :appearances, allow_destroy: true

  scope :latest,    -> { order(year: :desc) }
  scope :featured,  -> { where(featured: true) }
  scope :top,       -> { order(rating: :desc) }
  scope :ordered,   -> { order(created_at: :desc) }

  ratyrate_rateable 'rating'

  paginates_per 4

  RECORDS_LIMIT = 4

  def youtube_id
    self.url.split('/').last if self.url
  end

  def self.fetch_movies(params)
    case params[:type]
    when 'latest'
      Movie.latest
    when 'featured'
      Movie.featured
    when 'top'
      Movie.top
    else
      Movie.ordered
    end
  end
end
