class CreateGameStats < ActiveRecord::Migration[7.0]
  def change
    create_table :game_stats do |t|
      t.references :game, null: false, foreign_key: true
      t.references :player, null: false, foreign_key: true
      t.integer :period
      t.integer :field_goal_attempted, default: 0
      t.integer :field_goal_made, default: 0
      t.integer :free_throw_attempted, default: 0
      t.integer :free_throw_made, default: 0
      t.integer :three_point_attempted, default: 0
      t.integer :three_point_made, default: 0
      t.integer :fouls, default: 0

      t.timestamps
    end
  end
end
