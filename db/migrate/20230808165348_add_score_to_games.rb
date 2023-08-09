class AddScoreToGames < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :team1_score, :integer, default: 0
    add_column :games, :team2_score, :integer, default: 0
  end
end
