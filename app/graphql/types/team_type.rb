# frozen_string_literal: true

module Types
  class TeamType < Types::BaseObject
    field :id, ID, null: false
    field :tournament_id, Integer
    field :name, String
    field :tournament_name, String
    field :players, [PlayerType]
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    def tournament_name
      object.tournament.name
    end

  end
end
