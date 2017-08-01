class Report < ActiveRecord::Base
  belongs_to :user
  belongs_to :review

  paginates_per 5

  validates :review_id, uniqueness: { scope: :user_id }

  scope :ordered, -> { order(created_at: :desc) }
end
