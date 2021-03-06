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
    player_game_stat.id
  end

  def group_by_gender(items)
    items
      .group_by(&:gender)
      .map { |gender, items| OpenStruct.new(gender: gender.humanize, items: items) }
  end

  def new_post_link
    if current_admin && current_admin.superadmin?
      link_to 'New Post', new_post_path, class: 'pill'
    end
  end

  def facebook_share_url(url)
    "http://www.facebook.com/share.php?u=#{CGI.escape(url)}"
  end

  def facebook_page_url
    ENV['FACEBOOK']
  end

  def instagram_page_url
    ENV['INSTAGRAM']
  end

  def twitter_page_url
    ENV['TWITTER']
  end

  def youtube_page_url
    ENV['YOUTUBE']
  end

  def mixpanel_key
    ENV['MIXPANEL_KEY'].to_json.html_safe
  end
end
