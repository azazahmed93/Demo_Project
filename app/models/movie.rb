class Movie < ActiveRecord::Base
  has_many :posters, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :appearances
  has_many :actors , through: :appearances, dependent: :destroy

  accepts_nested_attributes_for :posters, allow_destroy: true
  accepts_nested_attributes_for :appearances, allow_destroy: true
  validates :title, presence: true

  ratyrate_rateable "rating"

  paginates_per 8

  def youtube_id
    self.url.split('/').last if self.url
  end
end
