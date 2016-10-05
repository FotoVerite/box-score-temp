# == Schema Information
#
# Table name: seasons
#
#  id         :integer          not null, primary key
#  year       :string(255)
#  start_date :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  sport_id   :string(255)
#  current    :boolean          default(FALSE)
#

FactoryGirl.define do
  factory :season do
    start_date { '2012-09-01' }
    year { '2012-2013' }
    sport_id { 'boys-basketball' }

    factory :baseball_season do
      sport_id { 'boys-baseball' }
    end
  end
end
