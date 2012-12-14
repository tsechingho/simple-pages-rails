class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, SimplePages::Page
  end
end
