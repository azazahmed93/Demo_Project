class Actor < ActiveRecord::Base
	has_many :appearances, dependent: :destroy
	has_many :movies, through: :appearances
end
