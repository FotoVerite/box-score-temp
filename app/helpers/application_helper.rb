module ApplicationHelper
  def body_attributes
    {
      class: ['box-score', controller.controller_name, controller.action_name].join(' ')
    }
  end

  def associations
    School.all.map { |s| s.assn }.uniq
  end
end
