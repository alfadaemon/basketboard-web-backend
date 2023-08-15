module Types
  class GameStatInputType < Types::BaseInputObject
    argument :game_id, ID, required: true
    argument :player_id, ID, required: true
    argument :team_id, ID, required: true
    argument :period, Integer, required: true
    argument :field_goal_attempted, Integer, required: false
    argument :field_goal_made, Integer, required: false
    argument :free_throw_attempted, Integer, required: false
    argument :free_throw_made, Integer, required: false
    argument :three_point_attempted, Integer, required: false
    argument :three_point_made, Integer, required: false
    argument :fouls, Integer, required: false
  end
end