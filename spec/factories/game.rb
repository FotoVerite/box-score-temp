FactoryGirl.define do
  factory :game do
    team
    opponent { team }
    date { Date.today }
    site { 'home' }
    home_away { 'home' }
    season
    game_stats {
      q1_points { rand(20).to_s }
      q2_points { rand(20).to_s }
      q3_points { rand(20).to_s }
      q4_points { rand(20).to_s }
      final_points { rand(20).to_s }
      opponent_q1_points { rand(20).to_s }
      opponent_q2_points { rand(20).to_s }
      opponent_q3_points { rand(20).to_s }
      opponent_q4_points { rand(20).to_s }
      opponent_final_points { rand(20).to_s }
    }
  end
end
