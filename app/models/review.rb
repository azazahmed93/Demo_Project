class Review < ActiveRecord::Base
  has_many :reports, dependent: :destroy
  belongs_to :user
  belongs_to :movie

  validates :content, presence: true

  paginates_per 5

  scope :ordered, -> { order(created_at: :desc) }

  def owner?(user)
    self.user == user
  end
end
