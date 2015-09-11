class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    can :manage, :all if user.role == "admin"
    can :create, Comment if user
    can :read, :all

  end
end
