# frozen_string_literal: true

module Mutations
  class UpdateGame < BaseMutation
    description "Updates a game by id"

    field :game, Types::GameType, null: false

    argument :id, ID, required: true
    argument :game_input, Types::GameInputType, required: true

    def resolve(id:, game_input:)
      game = ::Game.find(id)
      raise GraphQL::ExecutionError.new "Error updating game", extensions: game.errors.to_hash unless game.update(**game_input)

      { game: game }
    end
  end
end
