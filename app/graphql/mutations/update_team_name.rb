class Mutations::UpdateTeamName < Mutations::BaseMutation
  argument :team_id, ID, required: true
  argument :new_name, String, required: true

  field :team, Types::TeamType, null: false
  field :errors, [String], null: false

  def resolve(team_id:, new_name:)
    team = Team.find(team_id)

    team.name = new_name

    if team.save
      { team: team, errors: [] }
    else
      { team: nil, errors: team.errors.full_messages }
    end
  end
end