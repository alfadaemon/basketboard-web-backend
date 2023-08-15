# frozen_string_literal: true

module Types
  class GameStatType < Types::BaseObject
    field :id, ID, null: false
    field :game, GameType
    field :player, PlayerType
    field :team, TeamType
    field :period, Integer, null: false
    field :field_goal_attempted, Integer, null: false
    field :field_goal_made, Integer, null: false
    field :free_throw_attempted, Integer, null: false
    field :free_throw_made, Integer, null: false
    field :three_point_attempted, Integer, null: false
    field :three_point_made, Integer, null: false
    field :fouls, Integer, null: false
  end
end
