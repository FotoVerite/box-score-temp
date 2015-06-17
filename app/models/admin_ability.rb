class AdminAbility
  include CanCan::Ability

  def initialize(admin)
    if admin.superadmin?
      can :manage, Post
    end

    if admin.present?
      can :manage, School, id: admin.school_id
      can :manage, Team, school_id: admin.school_id
      can :manage, Game, school_id: admin.school_id
    end

    can :read, Post
    can :read, Game
    can :read, School
  end
end
