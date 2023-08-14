# frozen_string_literal: true

module Mutations
  class UpdateGameStat < BaseMutation
    description "Updates a game_stat by id"

    field :game_stat, Types::GameStatType, null: false

    argument :id, ID, required: true
    argument :game_stat_input, Types::GameStatInputType, required: true

    def resolve(id:, game_stat_input:)
      game_stat = ::GameStat.find(id)
      raise GraphQL::ExecutionError.new "Error updating game_stat", extensions: game_stat.errors.to_hash unless game_stat.update(**game_stat_input)

      { game_stat: game_stat }
    end
  end
end
