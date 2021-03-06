class User < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  has_many :reports, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :movies, through: :favorites

  has_attached_file :avatar,
                    styles: {
                      medium: '300x300>',
                      thumb: '100x100>',
                      small: '50x50>'
                    },
                    default_url: '/images/default.png'

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  ratyrate_rater

  paginates_per 5

  def generate_token
    self.auth_token = loop do
      random = SecureRandom.urlsafe_base64(nil, false)
      break random unless User.exists?(auth_token: random)
    end
  end

end
