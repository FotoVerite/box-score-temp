class AdminAbility
  include CanCan::Ability

  def initialize(admin)
    if admin.present?
      can :manage, School, id: admin.school_id
    end

    can :read, School
  end
end
