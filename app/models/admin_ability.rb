class AdminAbility
  include CanCan::Ability

  def initialize(admin)
    admin ||= Admin.new

    if admin.present?
      can :manage, School, id: admin.school_id
      can :read, School
    end
  end
end
