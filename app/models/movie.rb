class Movie < ActiveRecord::Base
	has_many :posters, dependent: :destroy

	def code
  		self.url.split('/').last if self.url
	end
	accepts_nested_attributes_for :posters
end
