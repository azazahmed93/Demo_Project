class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :favorites
  has_many :movies, through: :favorites
  has_attached_file :avatar , styles: { medium: "300x300>", thumb: "100x100>" }, 
  									# default_url: "/images/default_:style.png"
  									:default_url => "/images/2.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable  
end
