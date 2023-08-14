module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :tournaments, [Types::TournamentType], null: false,
      description: "Returns a list of all tournaments"
    def tournaments
      Tournament.all.includes(:teams) #Use includes to avoid N+1
    end

    field :teams, [Types::TeamType], null: false,
      description: "Returns a list of all teams"
    def teams
      Team.all.includes(team_players: [:player])
    end

    # Get all teams by tournament
    field :teams_by_tournament,[Types::TeamType], null: false do
      argument :tournament_id, ID, required: true
    end
    def teams_by_tournament(tournament_id:)
      teams = Team.where(tournament_id: tournament_id).includes(team_players: [:player])
    end

    field :games_by_tournament, [Types::GameType], null: false do
      argument :tournament_id, ID, required: true
    end
    def games_by_tournament(tournament_id:)
      Game.where(tournament_id: tournament_id).includes(:tournament)
    end

    # Get a specific team by id
    field :team, Types::TeamType, null: false do
      argument :id, ID, required: true
    end
    def team(id:)
      Team.find(id).includes(team_players: [:player])
    end

    # Get a specific team by name
    field :team_by_name, Types::TeamType, null: false do
      argument :name, String, required: true
    end
    def team_by_name(name:)
      Team.find_by(name: :name).includes(team_players: [:player])
    end

    field :players, [Types::PlayerType], null: false,
      description: "Returns a list of all players"
    def players
      Player.all
    end

    field :search_player, [Types::PlayerType], null: false do
      argument :search_term, String, required: true
    end
    def search_player(search_term:)
      return [] if search_term.empty?

      if search_term.scan(/\d+/).empty?
        Player.where('first_name LIKE :search OR last_name LIKE :search', search: "%#{search_term}%")
      else
        Player.where('doc_number LIKE :search', search: "%#{search_term}%")
      end
    end

    field :teams_players, [Types::TeamPlayerType], null: false,
      description: "Returns a list of all teams - players relationship"
    def teams_players
      TeamPlayer.all.includes(:team, :player) #Use includes to avoid N+1
    end
  end
end
