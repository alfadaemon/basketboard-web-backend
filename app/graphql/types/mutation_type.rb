module Types
  class MutationType < Types::BaseObject
    field :create_tournament, mutation: Mutations::CreateTournament
    field :create_teams, mutation: Mutations::CreateTeams
    field :create_player, mutation: Mutations::CreatePlayer
    field :update_team_name, mutation: Mutations::UpdateTeamName
    field :update_tournament_name, mutation: Mutations::UpdateTournamentName
  end
end
