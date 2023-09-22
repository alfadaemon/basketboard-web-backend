class Mutations::CreateOrUpdateTournament < Mutations::BaseMutation
  argument :tournament_input, Types::TournamentInputType

  field :tournament, Types::TournamentType, null: false
  field :errors, [String], null: false

  def resolve(tournament_input:)
    if tournament_input.id.nil?
      tournament = Tournament.new(**tournament_input)
      raise GraphQL::ExecutionError.new "Error creating new Tournament", extensions: tournament.errors.to_hash unless tournament.save

      return { tournament: tournament}
    end

    raise GraphQL::ExecutionError.new "Error updating Tournament #{tournament_input.id}" unless Tournament.upsert(**tournament_input)

    tournament = Tournament.find(tournament_input.id)
    return { tournament: tournament }
  end
end