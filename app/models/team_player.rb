class TeamPlayer < ApplicationRecord
  belongs_to :team
  belongs_to :player

  validate :must_play_in_one_team_per_tournament, on: :create

  def must_play_in_one_team_per_tournament
    tournaments = TeamPlayer.where(player_id: self.player_id).select(:team_id).map { | team | team.tournament_id }
    errors.add(:player_id, "#{self.player.full_name} already in tournament") if tournaments.include? self.tournament_id
  end

  def team_name
    self.team.name
  end

  def tournament_id
    self.team.tournament_id
  end

  def player_full_name
    self.player.full_name
  end
end
