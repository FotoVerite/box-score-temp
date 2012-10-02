SCHOOL_NAMES = ['Trinity', 'Southville', 'Lexington', 'Eastern Catholic', 'Westminster',
               'Northern', 'Lakeland', 'Bishop Kelly', 'Rexburg', 'Southern']
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

def create_school(name, league_id)
  name = "#{name} High School"
  schools = School.create! name: name, league_id: league_id
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

(1..3).each do |n|
  name = ASSOCIATION_NAMES[n-1]
  create_assn name
end

(1..6).each do |n|
  name = LEAGUE_NAMES[n-1]
  assn_id = Assn.all.sample.id
  create_league name, assn_id
end

(1..5).each do |n|
  name = SCHOOL_NAMES[n-1]
  assn_id = Assn.all.sample.id
  league_id = League.all.sample.id

  school = create_school name, league_id
  create_admin school, name
end

League.all.each do |league|
  Season.create!(start_date: Date.new(2011, 9, 9), end_date: Date.new(2012, 2, 2), league_id: league.id, name: '2011-2012', sport: 'Boys Baseball')
  Season.create!(start_date: Date.new(2011, 9, 9), end_date: Date.new(2012, 2, 2), league_id: league.id, name: '2011-2012', sport: 'Girls Softball')
  Season.create!(start_date: Date.new(2011, 9, 9), end_date: Date.new(2012, 2, 2), league_id: league.id, name: '2011-2012', sport: 'Boys Basketball')
  Season.create!(start_date: Date.new(2011, 9, 9), end_date: Date.new(2012, 2, 2), league_id: league.id, name: '2011-2012', sport: 'Girls Basketball')

  Season.create!(start_date: Date.new(2010, 9, 9), end_date: Date.new(2011, 2, 2), league_id: league.id, name: '2010-2011', sport: 'Boys Baseball')
  Season.create!(start_date: Date.new(2010, 9, 9), end_date: Date.new(2011, 2, 2), league_id: league.id, name: '2010-2011', sport: 'Girls Softball')
  Season.create!(start_date: Date.new(2010, 9, 9), end_date: Date.new(2011, 2, 2), league_id: league.id, name: '2010-2011', sport: 'Boys Basketball')
  Season.create!(start_date: Date.new(2010, 9, 9), end_date: Date.new(2011, 2, 2), league_id: league.id, name: '2010-2011', sport: 'Girls Basketball')
end
