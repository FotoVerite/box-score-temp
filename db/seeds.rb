# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

SCHOOL_NAMES = ['Trinity', 'Southville', 'Lexington', 'Eastern Catholic', 'Westminster',
               'Northern', 'Lakeland', 'Bishop Kelly', 'Rexburg', 'Southern']
ORGANIZATION_TYPES = ['PSAL', 'CHSAA', 'NYSAISAA']
CITY_NAMES = ['Brooklyn', 'Manhattan', 'Queens', 'Staten Island', 'Bronx']
LEAGUE_NAMES = ['League LL', 'League MM', 'League OO']

def create_admin(school, name)
  first_name = name
  last_name = 'Admin'
  password = 'testing'
  school_id = school.id
  admins = Admin.create! email: "#{first_name}.#{last_name}@example.com",
                         first_name: first_name, last_name: last_name, password: password,
                         school_id: school_id
end

def create_school(name, city, org_type)
  name = "#{name} High School"
  state = 'New York'
  schools = School.create! name: name, city: city, state: state,
                           organization_type: org_type
end

def create_league(name)
  leagues = League.create! name: name
end

Admin.delete_all
School.delete_all
League.delete_all

(1..5).each do |n|
  name = SCHOOL_NAMES[n-1]
  city = CITY_NAMES.sample
  org_type = ORGANIZATION_TYPES.sample

  school = create_school name, city, org_type
  create_admin school, name
end

(1..3).each do |n|
  name = LEAGUE_NAMES[n-1]
  create_league name
end
