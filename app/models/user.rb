class User < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  has_many :reports, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :posted_movies, class_name: 'Movie', :foreign_key => :user_id
  has_many :movies, through: :favorites
  has_many :active_relationships, class_name:  'Relationship',
                                  foreign_key: 'follower_id',
                                  dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed

  has_many :passive_relationships, class_name:  'Relationship',
                                  foreign_key: 'followed_id',
                                  dependent:   :destroy
  has_many :followers, through: :passive_relationships, source: :follower

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

  def follow(other_user)
    following << other_user
  end

  # Unfollows a user.
  def unfollow(other_user)
    following.delete(other_user)
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end

  def generate_token
    self.auth_token = loop do
      random = SecureRandom.urlsafe_base64(nil, false)
      break random unless User.exists?(auth_token: random)
    end
  end

end
