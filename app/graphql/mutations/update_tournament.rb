# frozen_string_literal: true

module Mutations
  class UpdateTournament < BaseMutation
    description "Updates a tournament"

    field :tournament, Types::TournamentType, null: false

    argument :id, ID, required: true
    argument :tournament_input, Types::TournamentInputType, required: true

    def resolve(id:, tournament_input:)
      tournament = ::Tournament.find(id)
      raise GraphQL::ExecutionError.new "Error updating tournament", extensions: tournament.errors.to_hash unless tournament.update(**tournament_input)

      { tournament: tournament }
    end
  end
end
