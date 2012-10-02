module TeamsHelper
  def league_seasons(team)
    seasons = Season.where(league_id: current_admin.school.league_id)
    seasons.map { |season| ["#{season.sport} #{season.name}", season.id] }
  end
end
