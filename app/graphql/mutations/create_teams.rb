class Mutations::CreateTeams < Mutations::BaseMutation
  argument :teams_names, [String], required: true
  argument :tournament_id, ID, required: true

  field :teams, [Types::TeamType], null: false
  field :errors, [String], null: false

  def resolve(teams_names:, tournament_id:)
    tournament = Tournament.find(tournament_id)
    teams_to_save = []

    teams_names.each do |name|
      teams_to_save << Team.new(name: name, tournament: tournament)
    end
    
    Team.transaction do
      teams_to_save.each(&:save!)
    end

    if teams_to_save.all?(&:persisted?)
      { teams: teams_to_save, errors: [] }
    else
      errors = teams_to_save.map { |team| team.errors.full_messages }
      { teams: nil, errors: errors }
    end
  end
end