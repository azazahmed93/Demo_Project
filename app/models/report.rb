class Report < ActiveRecord::Base
  belongs_to :user
  belongs_to :review

  validates :review_id, uniqueness: true
end
