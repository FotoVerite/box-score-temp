module ApplicationHelper
  def body_attributes
    {
      class: ['box-score', controller.controller_name, controller.action_name].join(' ')
    }
  end

  def organization_types
    School.all.map { |s| s.organization_type }.uniq
  end
end
