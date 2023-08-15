class GameStat < ApplicationRecord
  belongs_to :player
  belongs_to :game
  belongs_to :team

  #TODO: add validations for team->player and game->team before saving
  after_validation :teams_must_be_in_game, on: :create
  after_validation :player_must_be_in_team, on: :create

  private
    def teams_must_be_in_game
      team_in_game = self.game.local_team.id == self.team.id || self.game.away_team.id == self.team.id
      errors.add(:team, "A team is not assigned to this game") unless team_in_game
    end

    def player_must_be_in_team
      local_team_id = self.game.local_team.id
      away_team_id = self.game.away_team.id
      player_in_team = TeamPlayer.where(player_id: self.player_id, team_id: [local_team_id, away_team_id]).take
      errors.add(:player, "Player not in teams related to this game") unless player_in_team
    end
end
