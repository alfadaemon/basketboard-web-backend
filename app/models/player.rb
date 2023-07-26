class Player < ApplicationRecord
  has_many :team_players, dependent: :destroy

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
