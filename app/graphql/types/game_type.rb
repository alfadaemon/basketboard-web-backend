# frozen_string_literal: true

module Types
  class GameType < Types::BaseObject
    field :id, ID, null: false
    field :local, TeamType
    field :away, TeamType
    field :local_score, Integer, null: false
    field :away_score, Integer, null: false
    field :tournament, TournamentType
    field :on_date, GraphQL::Types::ISO8601Date
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    def local
      object.team1
    end
    
    def away
      object.team2
    end

    def local_score
      object.team1_score
    end

    def away_score
      object.team2_score
    end
  end
end
