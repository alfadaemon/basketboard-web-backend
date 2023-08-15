# frozen_string_literal: true

module Mutations
  class CreateGameStat < BaseMutation
    description "Creates a new game_stat"

    field :game_stat, Types::GameStatType, null: false

    argument :game_stat_input, Types::GameStatInputType, required: true

    def resolve(game_stat_input:)
      game_stat = ::GameStat.new(**game_stat_input)
      raise GraphQL::ExecutionError.new "Error creating game_stat", extensions: game_stat.errors.to_hash unless game_stat.save

      { game_stat: game_stat }
    end
  end
end
