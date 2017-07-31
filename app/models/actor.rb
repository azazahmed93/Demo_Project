class Actor < ActiveRecord::Base
  has_many :appearances, dependent: :destroy
  has_many :movies, through: :appearances

  validates :name, presence: true
  validates_format_of :name, with: /^[a-z]+$/i, multiline: true
  paginates_per 5
end
