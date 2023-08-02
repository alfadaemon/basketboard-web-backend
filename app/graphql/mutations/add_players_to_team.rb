class Mutations::AddPlayersToTeam < Mutations::BaseMutation
  argument :players_ids, [ID], required: true
  argument :team_id, ID, required: true

  field :team, Types::TeamType, null: false
  field :errors, [String], null: false

  def resolve(players_ids:, team_id:)
    team = Team.find(team_id)
    players_to_add = []

    players_ids.each do |id|
      player = Player.find(id)
      players_to_add << TeamPlayer.create!(player: player, team: team) 
    end
    
    TeamPlayer.transaction do
      players_to_add.each(&:save!)
    end

    if players_to_add.all?(&:persisted?)
      { team: team, errors: [] }
    else
      errors = players_to_add.map { |player| player.errors.full_messages }
      { teams: nil, errors: errors }
    end
  end
end