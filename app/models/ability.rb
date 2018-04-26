class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :manage, Movie
      can :manage, Actor
      can [:read, :destroy], Review
      can :manage, User
      can :manage, Report
    elsif user.confirmed_at.present?
      can :manage, Movie
      can :manage, Actor
      can :manage, Report
    else
      can :read, :all
    end
    can [:update, :destroy], Review, user_id: user.id
  end
end
