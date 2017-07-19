class Movie < ActiveRecord::Base
	def code
  		self.url.split('/').last if self.url
	end
end
