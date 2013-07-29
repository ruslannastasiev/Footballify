class CreateFootballifyChampionships < ActiveRecord::Migration
  def change
    create_table :footballify_championships do |t|
      t.string :name

      t.timestamps
    end
  end
end
