# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def create_admin(school, name)
  first_name = name
  last_name = 'Admin'
  password = 'testing'
  school_id = school.id
  admins = Admin.create! email: "#{first_name}.#{last_name}@example.com",
                         first_name: first_name, last_name: last_name, password: password,
                         school_id: school_id
end

def create_school(str)
  name = "#{str} High School"
  city = ['Brooklyn', 'Manhattan', 'Queens', 'Staten Island', 'Bronx'].sample
  state = 'New York'
  organization_type = ['PSAL', 'CHSAA', 'NYSAISAA'].sample
  schools = School.create! name: name, city: city, state: state,
                           organization_type: organization_type
end

Admin.delete_all
School.delete_all

names = ['Trinity', 'Southville', 'Lexington', 'Eastern Catholic', 'Westminster']

(1..5).each do |n|
  name = names[n-1]

  school = create_school name
  create_admin school, name
end
