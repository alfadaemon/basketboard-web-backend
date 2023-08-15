module Types
  class MutationType < Types::BaseObject
    field :delete_game_stat, mutation: Mutations::DeleteGameStat
    field :update_game_stat, mutation: Mutations::UpdateGameStat
    field :create_game, mutation: Mutations::CreateGame
    field :update_game, mutation: Mutations::UpdateGame
    field :create_game_stat, mutation: Mutations::CreateGameStat
    field :create_tournament, mutation: Mutations::CreateTournament
    field :create_teams, mutation: Mutations::CreateTeams
    field :create_player, mutation: Mutations::CreatePlayer
    field :update_team_name, mutation: Mutations::UpdateTeamName
    field :update_tournament_name, mutation: Mutations::UpdateTournamentName
    field :add_players_to_team, mutation: Mutations::AddPlayersToTeam
    field :remove_player_from_team, mutation: Mutations::RemovePlayerFromTeam
    field :update_player, mutation: Mutations::UpdatePlayer
  end
end
