# frozen_string_literal: true

module Types
  class GameType < Types::BaseObject
    field :id, ID, null: false
    field :local, TeamType
    field :away, TeamType
    field :local_team_score, Integer, null: false
    field :away_team_score, Integer, null: false
    field :tournament, TournamentType
    field :on_date, GraphQL::Types::ISO8601Date
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
