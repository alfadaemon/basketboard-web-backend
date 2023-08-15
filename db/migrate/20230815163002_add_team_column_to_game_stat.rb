class AddTeamColumnToGameStat < ActiveRecord::Migration[7.0]
  def change
    add_reference :game_stats, :team, null: false, foreign_key: true
  end
end
