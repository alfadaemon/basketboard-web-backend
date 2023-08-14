class Game < ApplicationRecord
  belongs_to :tournament
  belongs_to :team1, class_name: 'Team'
  belongs_to :team2, class_name: 'Team'

  has_many :game_stats
  
  after_validation :must_be_in_same_tournament, on: :create

  def team1_name
    self.team1.name
  end

  def team2_name
    self.team2.name
  end

  private
    def must_be_in_same_tournament
      same_tournament = self.tournament_id == self.team1.tournament_id && self.tournament_id == self.team2.tournament_id
      errors.add(:game, "Teams not in same tournament") unless same_tournament
    end
end
