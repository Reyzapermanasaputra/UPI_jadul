class Ability
  include CanCan::Ability
    def initialize(user)
    guest = User.new
    guest.role = Role.new
    guest.role.name = "Regular"
    user ||= guest # Guest user
      if user.admin?
        can :manage, :all
      else
        can :read, Topic
        can :read, Unit
        can :read, Content
      end
      if user.author?
        can :read, Topic
        can :read, Unit
        can :create, Unit
        can :read, Content
        can :create, Content
        can :update, Unit do |unit|
          unit.try(:user) == user
        end
        can :update, Content do |content|
          content.try(:user) == user
        end
        can :destroy, Content do |content|
           content.try(:user) == user
        end
        can :destroy, Unit do |unit|
          unit.try(:user) == user
        end
      else
        can :read, Topic
        can :read, Unit
        can :read, Content
      end
      end
end
