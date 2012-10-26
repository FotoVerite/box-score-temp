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

Admin.delete_all
School.delete_all
Assn.delete_all
League.delete_all
Season.delete_all
Player.delete_all
Team.delete_all
Game.delete_all

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

Season.create!(start_date: Date.new(2012, 9, 9), year: '2012-2013', current: true)
Season.create!(start_date: Date.new(2012, 9, 9), year: '2012-2013', current: true)
Season.create!(start_date: Date.new(2012, 9, 9), year: '2012-2013', current: true)
Season.create!(start_date: Date.new(2012, 9, 9), year: '2012-2013', current: true)
Season.create!(start_date: Date.new(2011, 9, 9), year: '2011-2012')
Season.create!(start_date: Date.new(2011, 9, 9), year: '2011-2012')
Season.create!(start_date: Date.new(2011, 9, 9), year: '2011-2012')
Season.create!(start_date: Date.new(2011, 9, 9), year: '2011-2012')

(0..11).each do |num|
  Team.create!(sport: 'Boys Baseball', school_id: School.all.to_a[num].id, season_id: Season.all.to_a[0].id)
  Team.create!(sport: 'Boys Basketball', school_id: School.all.to_a[num].id, season_id: Season.all.to_a[1].id)
  Team.create!(sport: 'Girls Softball', school_id: School.all.to_a[num].id, season_id: Season.all.to_a[2].id)
  Team.create!(sport: 'Girls Basketball', school_id: School.all.to_a[num].id, season_id: Season.all.to_a[3].id)
end

Team.all.each do |team|
  other_teams = Team.where('sport = :sport and id != :id', sport: team.sport, id: team.id)
  other_teams.each do |opponent|
    random_date = Time.at(1319471760.092567 + rand * (Time.now.to_f - 1319471760.092567.to_f)).stamp('2011-11-11')
    game = Game.create!(date: random_date, home_away: 'home', site: 'home', team_id: team.id, opponent_id: opponent.id)
    game.save!
  end
end

('A'..'Z').each do |first_letter|
  ('A'..'Z').each do |second_letter|
    player = Player.create! first_name: "#{first_letter}rmathy", last_name: "#{second_letter}mith"
  end
end
