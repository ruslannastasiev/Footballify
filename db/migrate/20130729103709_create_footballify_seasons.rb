class CreateFootballifySeasons < ActiveRecord::Migration
  def change
    create_table :footballify_seasons do |t|
      t.string :start_date
      t.string :description
      t.integer :championship_id

      t.timestamps
    end
  end
end
