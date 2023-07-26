module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :tournaments, [Types::TournamentType], null: false,
      description: "Returns a list of all tournaments"
    def tournaments
      Tournament.all.includes(:teams) #Use includes to avoid N+1
    end

    field :teams, [Types::TeamType], null: false,
      description: "Returns a list of all teams"
    def teams
      Team.all
    end

    # Get all teams by tournament
    field :teams_by_tournament,[Types::TeamType], null: false do
      argument :tournament_id, ID, required: true
    end
    def teams_by_tournament(tournament_id:)
      teams = Team.where(tournament_id: tournament_id)
    end

    # Get a specific team by id
    field :team, Types::TeamType, null: false do
      argument :id, ID, required: true
    end
    def team(id:)
      Team.find(id)
    end

    # Get a specific team by name
    field :team_by_name, Types::TeamType, null: false do
      argument :name, String, required: true
    end
    def team_by_name(name:)
      Team.find_by(name: :name)
    end

    # Get a specific team
    #field :player_by_team_tournament, Types::PlayerType, null: false do
    #  argument :team_id, ID, required: true
    #  argument :tournament_id, ID, required: true
    #end
    #def teamByName(team_id:, tournament_id:)
    #  Player.find_by(team_id: team_id, tournament_id: tournament_id)
    #end
  end
end
