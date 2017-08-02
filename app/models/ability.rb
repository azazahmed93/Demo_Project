class Ability
  include CanCan::Ability

    def initialize(user)
      user ||= User.new

      if user.admin?
        can :manage, Movie
        can :manage, Actor
        can [:read, :destroy], Review
        can :manage, User
      else
        can :read, :all
      end
      can [:update, :destroy], Review, user_id: user.id
  end
end
