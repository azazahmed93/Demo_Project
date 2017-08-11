class Actor < ActiveRecord::Base
  has_many :appearances, dependent: :destroy
  has_many :movies, through: :appearances

  validates :name, presence: true
  validates :name, format: { with: /[\w]+([\s]+[\w]+){1}+/ }

  paginates_per 5
end
