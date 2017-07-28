class Ability
  include CanCan::Ability

    def initialize(user)
      user ||= User.new # guest user (not logged in)
      if user.admin?
        can :manage, Movie
        can :delete, Review
        can :read, Review
      else
        can :read, Movie
        can [:edit, :update, :destroy], Review, user_id: user.id
      end
  end
end
