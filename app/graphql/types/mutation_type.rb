module Types
  class MutationType < Types::BaseObject
    field :create_tournament, mutation: Mutations::CreateTournament
    field :add_teams_to_tournament, mutation: Mutations::AddTeamsTournament
    field :update_team_name, mutation: Mutations::UpdateTeamName
    field :update_tournament_name, mutation: Mutations::UpdateTournamentName
  end
end
