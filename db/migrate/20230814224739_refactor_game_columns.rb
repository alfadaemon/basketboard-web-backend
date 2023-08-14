class RefactorGameColumns < ActiveRecord::Migration[7.0]
  def change
    rename_column :games, :team1_id, :local_team_id
    rename_column :games, :team2_id, :away_team_id
    rename_column :games, :team1_score, :local_team_score
    rename_column :games, :team2_score, :away_team_score
  end
end
