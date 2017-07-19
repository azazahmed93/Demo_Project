class Movie < ActiveRecord::Base
	has_many :posters

	def code
  		self.url.split('/').last if self.url
	end
end
