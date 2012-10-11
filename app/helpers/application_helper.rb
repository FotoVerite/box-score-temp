module ApplicationHelper
  def body_attributes
    {
      class: ['box-score', controller.controller_name, controller.action_name].join(' ')
    }
  end

  def game_stats_period_field(team, period)
    "game[game_stats][#{team.id}][periods][#{period}]"
  end
end
