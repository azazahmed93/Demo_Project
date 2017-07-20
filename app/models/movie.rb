class Movie < ActiveRecord::Base

	has_many :posters, dependent: :destroy
	has_many :appearances
	has_many :actors , through: :appearances, dependent: :destroy
	accepts_nested_attributes_for :posters
	accepts_nested_attributes_for :actors

	def code
  		self.url.split('/').last if self.url
	end

end
