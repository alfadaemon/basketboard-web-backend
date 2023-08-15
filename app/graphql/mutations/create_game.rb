# frozen_string_literal: true

module Mutations
  class CreateGame < BaseMutation
    description "Creates a new game"

    field :game, Types::GameType, null: false

    argument :game_input, Types::GameInputType, required: true

    def resolve(game_input:)
      game = ::Game.new(**game_input)
      raise GraphQL::ExecutionError.new "Error creating game", extensions: game.errors.to_hash unless game.save

      { game: game }
    end
  end
end
