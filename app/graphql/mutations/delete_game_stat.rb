# frozen_string_literal: true

module Mutations
  class DeleteGameStat < BaseMutation
    description "Deletes a game_stat by ID"

    field :game_stat, Types::GameStatType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      game_stat = ::GameStat.find(id)
      raise GraphQL::ExecutionError.new "Error deleting game_stat", extensions: game_stat.errors.to_hash unless game_stat.destroy

      { game_stat: game_stat }
    end
  end
end
