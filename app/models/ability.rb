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
        can :update, User
        can :manage, Topic
        can :manage, Unit
        can :manage, Content
        can :manage, Question
        can :manage, Assigment
        can :manage, CollectionAssigment
        can :manage, Evaluation
        can :manage, Score
        can :manage, Quiz
      else
        can :update, User
        can :add_room, User
        can :read, Topic
        can :read, Unit
        can :read, Content
        can :read, Question
        can :read, Assigment
        can :read, Evaluation
        can :create, CollectionAssigment
      end
end
end
