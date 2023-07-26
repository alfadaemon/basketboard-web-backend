class Mutations::UpdateTournamentName < Mutations::BaseMutation
  argument :tournament_id, ID, required: true
  argument :new_name, String, required: true

  field :tournament, Types::TournamentType, null: false
  field :errors, [String], null: false

  def resolve(tournament_id:, new_name:)
    tournament = Tournament.find(tournament_id)

    tournament.name = new_name

    if tournament.save
      { tournament: tournament, errors: [] }
    else
      { tournament: nil, errors: tournament.errors.full_messages }
    end
  end
end