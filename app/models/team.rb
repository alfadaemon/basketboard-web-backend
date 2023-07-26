class Team < ApplicationRecord
  belongs_to :tournament
  has_many :team_players, dependent: :destroy
end
