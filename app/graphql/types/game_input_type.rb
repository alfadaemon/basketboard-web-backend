module Types
  class GameInputType < Types::BaseInputObject
    argument :team1_id, ID, required: true
    argument :team2_id, ID, required: true
    argument :tournament_id, ID, required: true
    argument :team1_score, Integer, required: false
    argument :team2_score, Integer, required: false
    argument :on_date, GraphQL::Types::ISO8601DateTime, required: false
  end
end