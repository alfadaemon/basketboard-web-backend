class TeamPlayer < ApplicationRecord
  belongs_to :team
  belongs_to :player

  def team_name
    self.team.name
  end

  def player_full_name
    self.player.full_name
  end
end
