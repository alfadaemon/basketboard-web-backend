# frozen_string_literal: true

module Types
  class TeamPlayerType < Types::BaseObject
    field :id, ID, null: false
    field :team_id, Integer, null: false
    field :player_id, Integer, null: false
    field :team_name, String, null: false
    field :player_full_name, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
