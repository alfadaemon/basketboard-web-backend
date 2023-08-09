class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.references :team1, null: false, foreign_key: { to_table: :teams }
      t.references :team2, null: false, foreign_key: { to_table: :teams }
      t.references :tournament, null: false, foreign_key: { to_table: :tournaments }
      t.date :on_date

      t.timestamps
    end
  end
end
