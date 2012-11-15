module ApplicationHelper
  def body_attributes
    {
      class: ['box-score', controller.controller_name, controller.action_name].join(' ')
    }
  end

  def game_stats_period_field(team, period)
    "game[game_stats][#{team.id}][periods][#{period}]"
  end

  def child_index(player_game_stat)
    return 'CHILD' if player_game_stat.player_id.blank?
    player_game_stat.player_id
  end

  def facebook_share_url(url)
    "http://www.facebook.com/share.php?u=#{CGI.escape(url)}"
  end

  def group_by_gender(items)
    items
      .group_by(&:gender)
      .map { |gender, items| OpenStruct.new(gender: gender.humanize, items: items) }
  end

  def superadmin_dashboard_link
    if current_admin && current_admin.email == 'patrick@hsboxscoresnyc.com'
      link_to 'SuperAdmin Dashboard', '/superadmin', class: 'superadmin-dashboard alert button'
    end
  end
end
