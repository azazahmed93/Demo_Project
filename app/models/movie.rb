class Movie < ActiveRecord::Base
	has_many :posters
	has_many :favorites
	has_many :users, through: :favorites
	has_many :actors, through: :appearances 
	def code
  		self.url.split('/').last if self.url
	end
end
