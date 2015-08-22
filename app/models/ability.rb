class Ability
  include CanCan::Ability
    def initialize(user)
    guest = User.new
    guest.role = Role.new
    guest.role.name = "Regular"
    user ||= guest # Guest user
      if user.admin?
        can :manage, :all
      end
      if user.lecturer?
        can :manage, Topic
        can :manage, Unit
        can :manage, Content
        can :manage, Question
        can :manage, Assigment
      else
        can :read, Topic
        can :read, Unit
        can :read, Content
        can :read, Question
        can :read, Assigment
        can :read, Classroom
        can :create, CollectionAssigment
      end
end
end
