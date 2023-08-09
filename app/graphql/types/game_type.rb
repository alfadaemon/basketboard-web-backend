# frozen_string_literal: true

module Types
  class GameType < Types::BaseObject
    field :id, ID, null: false
    field :team1_id, Integer, null: false
    field :team2_id, Integer, null: false
    field :team1_score, Integer, null: false
    field :team2_score, Integer, null: false
    field :tournament, GraphQL::Types::TournamentType
    field :on_date, GraphQL::Types::ISO8601Date
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
