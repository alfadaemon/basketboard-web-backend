class Mutations::RemovePlayerFromTeam < Mutations::BaseMutation
  argument :player_id, ID, required: true
  argument :team_id, ID, required: true

  field :team, Types::TeamType, null: false
  field :errors, [String], null: false

  def resolve(player_id:, team_id:)
    team = Team.find(team_id)
    player = Player.find(player_id)
    
    team_player_to_delete = TeamPlayer.find team_id: team_id, player_id: player_id

    if team_player_to_delete and team_player_to_delete.destroy
      { team: team, errors: [] }
    else
      errors = team_player_to_delete.map { |player| player.errors.full_messages }
      { teams: nil, errors: errors }
    end
  end
end