Admin.delete_all
School.delete_all
Assn.delete_all
League.delete_all
Season.delete_all
Player.delete_all
Team.delete_all
Game.delete_all


SCHOOL_NAMES = ['Trinity', 'Southville', 'Lexington', 'Eastern Catholic', 'Westminster',
               'Northern', 'Lakeland', 'Bishop Kelly', 'Rexburg', 'Southern', 'Eastminster', 'Western Catholic']
ASSOCIATION_NAMES = ['PSAL', 'CHSAA', 'NYSAISAA']
LEAGUE_NAMES = ['Brooklyn AA', 'Queens AA', 'Long Island AA', 'Brooklyn AAA', 'Queens AAA', 'Long Island AAA']

def create_admin(school, name)
  first_name = name
  last_name = 'Admin'
  password = 'testing'
  school_id = school.id
  admins = Admin.create! email: "#{first_name}.#{last_name}@example.com",
                         first_name: first_name, last_name: last_name, password: password,
                         school_id: school_id
end

def create_school(name)
  schools = School.create! name: name
end

def create_assn(name)
  assn = Assn.create! name: name
end

def create_league(name, assn_id)
  league = League.create! name: name, assn_id: assn_id
end

(1..3).each do |n|
  name = ASSOCIATION_NAMES[n-1]
  create_assn name
end

['Brooklyn AA', 'Queens AA'].each do |name|
  assn_id = Assn.all.to_a[0].id
  create_league name, assn_id
end

['Long Island AA', 'Brooklyn AAA'].each do |name|
  assn_id = Assn.all.to_a[1].id
  create_league name, assn_id
end

['Queens AAA', 'Long Island AAA'].each do |name|
  assn_id = Assn.all.to_a[2].id
  create_league name, assn_id
end

['Trinity', 'Southville'].each do |name|
  league_id = League.all.to_a[0].id
  school = create_school name
  create_admin school, name
end

['Lexington', 'Eastern Catholic'].each do |name|
  league_id = League.all.to_a[1].id
  school = create_school name
  create_admin school, name
end

['Westminster', 'Northern'].each do |name|
  league_id = League.all.to_a[2].id
  school = create_school name
  create_admin school, name
end

['Lakeland', 'Bishop Kelly'].each do |name|
  league_id = League.all.to_a[3].id
  school = create_school name
  create_admin school, name
end

['Rexburg', 'Southern'].each do |name|
  league_id = League.all.to_a[4].id
  school = create_school name
  create_admin school, name
end

['Eastminster', 'Western Catholic'].each do |name|
  league_id = League.all.to_a[5].id
  school = create_school name
  create_admin school, name
end

boys_baseball_season    = Season.create!(start_date: Date.new(2012, 9, 9), year: '2012-2013', current: true)
boys_basketball_season  = Season.create!(start_date: Date.new(2012, 9, 9), year: '2012-2013', current: true)
girls_softball_season   = Season.create!(start_date: Date.new(2012, 9, 9), year: '2012-2013', current: true)
girls_basketball_season = Season.create!(start_date: Date.new(2012, 9, 9), year: '2012-2013', current: true)

# prior seasons
Season.create!(start_date: Date.new(2011, 9, 9), year: '2011-2012')
Season.create!(start_date: Date.new(2011, 9, 9), year: '2011-2012')
Season.create!(start_date: Date.new(2011, 9, 9), year: '2011-2012')
Season.create!(start_date: Date.new(2011, 9, 9), year: '2011-2012')

School.all.each do |school|
  Team.create!(sport_id: 'boys-baseball', league_id: League.all.sample.id, school_id: school.id, season_id: boys_baseball_season.id)
  Team.create!(sport_id: 'boys-basketball', league_id: League.all.sample.id, school_id: school.id, season_id: boys_basketball_season.id)
  Team.create!(sport_id: 'girls-softball', league_id: League.all.sample.id, school_id: school.id, season_id: girls_softball_season.id)
  Team.create!(sport_id: 'girls-basketball', league_id: League.all.sample.id, school_id: school.id, season_id: girls_basketball_season.id)
end

def random_game_stats(team, opponent)
  case team.sport_type
  when 'basketball'
    {
      team.id.to_s => {
        "periods" => Hash[(1..4).map { |p| [p.to_s, rand(25).to_s] }],
      },
      opponent.id.to_s => {
        "periods" => Hash[(1..4).map { |p| [p.to_s, rand(25).to_s] }],
      }
    }
  when 'baseball'
    {
      team.id.to_s => {
        "periods" => Hash[(1..7).map { |p| [p.to_s, rand(4).to_s] }],
        "hits" => rand(20).to_s,
        "errors" => rand(5).to_s
      },
      opponent.id.to_s => {
        "periods" => Hash[(1..7).map { |p| [p.to_s, rand(4).to_s] }],
        "hits" => rand(20).to_s,
        "errors" => rand(5).to_s
      }
    }
  end
end

Team.all.each do |team|
  team.potential_opponents.each do |opponent|
    random_date = team.season.start_date + rand(100)

    Game.create!(date: random_date, home_away: 'home', site: 'home',
      team_id: team.id, opponent_id: opponent.id, game_stats: random_game_stats(team, opponent))
  end
end

('A'..'Z').each do |first_letter|
  ('A'..'Z').each do |second_letter|
    player = Player.create! first_name: "#{first_letter}rmathy", last_name: "#{second_letter}mith"
  end
end
