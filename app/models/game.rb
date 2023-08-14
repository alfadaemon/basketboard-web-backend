class Game < ApplicationRecord
  belongs_to :tournament
  belongs_to :local_team, class_name: 'Team'
  belongs_to :away_team, class_name: 'Team'
  
  after_validation :must_be_in_same_tournament, on: :create

  def local_team_name
    self.local.name
  end

  def away_team_name
    self.away.name
  end

  private
    def must_be_in_same_tournament
      same_tournament = self.tournament_id == self.team1.tournament_id && self.tournament_id == self.team2.tournament_id
      errors.add(:game, "Teams not in same tournament") unless same_tournament
    end
end
