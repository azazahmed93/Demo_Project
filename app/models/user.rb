class User < ActiveRecord::Base
  has_many :favorites
  has_many :movies, through: :favorites
  has_attached_file :avatar , styles: { medium: "300x300>", thumb: "100x100>" , small: "50x50>" },
  									:default_url => "/images/2.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
end
