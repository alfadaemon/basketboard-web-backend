# frozen_string_literal: true

module Types
  class TournamentType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :teams, [TeamType]
    field :start_date, GraphQL::Types::ISO8601DateTime
    field :end_date, GraphQL::Types::ISO8601DateTime
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
