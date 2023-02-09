class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    can :manage, :all, user_id: user.id
    can :read, Recipe, public: true
  end
end
