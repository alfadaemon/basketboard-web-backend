class Team < ApplicationRecord
  belongs_to :tournament
  has_many :team_players, dependent: :destroy
  has_many :players, through: :team_players
  has_many :games, dependent: :destroy
  has_many :game_stats
end
