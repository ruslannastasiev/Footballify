class CreateFootballifyScores < ActiveRecord::Migration
  def change
    create_table :footballify_scores do |t|
      t.integer :team1_id
      t.integer :team2_id
      t.integer :team1_score
      t.integer :team2_score
      t.integer :round
      t.integer :season_id

      t.timestamps
    end
  end
end
