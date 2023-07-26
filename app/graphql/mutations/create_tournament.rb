class Mutations::CreateTournament < Mutations::BaseMutation
  argument :name, String, required: true
  argument :start_date, GraphQL::Types::ISO8601DateTime, required: true
  argument :end_date, GraphQL::Types::ISO8601DateTime, required: true

  field :tournament, Types::TournamentType, null: false
  field :errors, [String], null: false

  def resolve(name:, start_date:, end_date:)
    tournament = Tournament.new(name: name, start_date: start_date, end_date: end_date)

    if tournament.save
      { tournament: tournament, errors: [] }
    else
      { tournament: nil, errors: tournament.errors.full_messages }
    end
  end
end