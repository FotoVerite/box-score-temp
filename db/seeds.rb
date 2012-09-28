SCHOOL_NAMES = ['Trinity', 'Southville', 'Lexington', 'Eastern Catholic', 'Westminster',
               'Northern', 'Lakeland', 'Bishop Kelly', 'Rexburg', 'Southern']
ASSOCIATIONS = ['PSAL', 'CHSAA', 'NYSAISAA']
LEAGUE_NAMES = ['Brooklyn AA', 'Queens AAA', 'Long Island AA']

def create_admin(school, name)
  first_name = name
  last_name = 'Admin'
  password = 'testing'
  school_id = school.id
  admins = Admin.create! email: "#{first_name}.#{last_name}@example.com",
                         first_name: first_name, last_name: last_name, password: password,
                         school_id: school_id
end

def create_school(name, association)
  name = "#{name} High School"
  schools = School.create! name: name, association: association
end

def create_league(name)
  leagues = League.create! name: name
end

Admin.delete_all
School.delete_all
League.delete_all

(1..5).each do |n|
  name = SCHOOL_NAMES[n-1]
  association = ASSOCIATIONS.sample

  school = create_school name, association
  create_admin school, name
end

(1..3).each do |n|
  name = LEAGUE_NAMES[n-1]
  create_league name
end
