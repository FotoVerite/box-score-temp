# == Schema Information
#
# Table name: teams
#
#  id                :integer          not null, primary key
#  school_id         :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  season_id         :integer
#  league_id         :integer
#  sport_id          :string(255)
#  coach_name        :string(255)
#  coach_email       :string(255)
#  coach_phone       :string(255)
#  competitive_class :string(255)
#

FactoryBot.define do
  factory :team do
    league
    school
    season
    sport_id 'boys-basketball'
  end
end
