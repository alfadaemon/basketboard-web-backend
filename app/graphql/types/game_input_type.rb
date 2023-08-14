module Types
  class GameInputType < Types::BaseInputObject
    argument :local_team_id, ID, required: true
    argument :away_team_id, ID, required: true
    argument :tournament_id, ID, required: true
    argument :local_team_score, Integer, required: false
    argument :away_team_score, Integer, required: false
    argument :on_date, GraphQL::Types::ISO8601DateTime, required: false
  end
end