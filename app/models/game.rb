class Game < ApplicationRecord
  belongs_to :tournament
  belongs_to :local_team, class_name: 'Team'
  belongs_to :away_team, class_name: 'Team'

  has_many :game_stats
  
  after_validation :must_be_in_same_tournament, on: :create

  def local_team_name
    self.local_team.name
  end

  def away_team_name
    self.away_team.name
  end

  private
    def must_be_in_same_tournament
      same_tournament = self.tournament_id == self.local_team.tournament_id && self.tournament_id == self.away_team.tournament_id
      errors.add(:game, "Teams not in same tournament") unless same_tournament
    end
end
