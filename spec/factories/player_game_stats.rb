# == Schema Information
#
# Table name: player_game_stats
#
#  id         :integer          not null, primary key
#  game_id    :integer
#  player_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  stats      :text
#  position   :integer
#

FactoryGirl.define do
  factory :player_game_stat do
    player
    game
    stats { Hash.new }

    factory :baseball_player_game_stat do
      stats do
        pos { 'LF' }
        ab { rand(5).to_s }
        h { rand(5).to_s }
        hr { rand(5).to_s }
        rbi { rand(10).to_s }
        e { rand(3).to_s }
      end
    end

    factory :basketball_player_game_stat do
      pos { 'starter' }
      pts { rand(40).to_s }
      fg { rand(20).to_s }
      fga { rand(20).to_s }
      three_pt_fg { rand(10).to_s }
      three_pt_fga { rand(10).to_s }
      ft { rand(10).to_s }
      fta { rand(10).to_s }
      reb { rand(10).to_s }
      a { rand(10).to_s }
    end
  end
end
