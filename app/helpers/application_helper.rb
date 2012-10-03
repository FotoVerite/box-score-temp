module ApplicationHelper
  def body_attributes
    {
      class: ['box-score', controller.controller_name, controller.action_name].join(' ')
    }
  end

  def league_assns
    League.uniq.map{ |league| ["#{league.name} (#{league.assn.name})", league.id] }
  end

  def teams_in_league
    result = current_admin.school.league.schools.map { |school| school.teams }.flatten
  end
end
