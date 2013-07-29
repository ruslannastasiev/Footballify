class CreateFootballifyTeams < ActiveRecord::Migration
  def change
    create_table :footballify_teams do |t|
      t.integer :name
      t.integer :championship_id

      t.timestamps
    end
  end
end
