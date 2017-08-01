class Actor < ActiveRecord::Base
  has_many :appearances, dependent: :destroy
  has_many :movies, through: :appearances

  validates :name, presence: true
  validates :name, format: { with: /\A[a-z]+\z/i }

  paginates_per 5
end
