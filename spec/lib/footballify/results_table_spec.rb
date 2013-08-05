require 'spec_helper'

module Footballify

  describe "ResultsTable" do

    let!(:season){ create :season, scores: [score1, score2, score3,
                                            score4, score5, score6,
                                            score7, score8, score9,
                                            score10, score11, score12] }
    let!(:score1){ create :score, team1_id: 1, team2_id: 4, team1_score: "1", team2_score: "2"}
    let!(:score2){ create :score, team1_id: 4, team2_id: 1, team1_score: "1", team2_score: "2"}
    let!(:score3){ create :score, team1_id: 2, team2_id: 3, team1_score: "1", team2_score: "2"}
    let!(:score4){ create :score, team1_id: 3, team2_id: 2, team1_score: "1", team2_score: "2"}
    let!(:score5){ create :score, team1_id: 1, team2_id: 2, team1_score: "1", team2_score: "2"}
    let!(:score6){ create :score, team1_id: 2, team2_id: 1, team1_score: "1", team2_score: "2"}
    let!(:score7){ create :score, team1_id: 3, team2_id: 4, team1_score: "1", team2_score: "2"}
    let!(:score8){ create :score, team1_id: 4, team2_id: 3, team1_score: "1", team2_score: "2"}
    let!(:score9){ create :score, team1_id: 1, team2_id: 3, team1_score: "1", team2_score: "1"}
    let!(:score10){ create :score, team1_id: 3, team2_id: 1, team1_score: "1", team2_score: "1"}
    let!(:score11){ create :score, team1_id: 4, team2_id: 2, team1_score: "1", team2_score: "1"}
    let!(:score12){ create :score, team1_id: 2, team2_id: 4, team1_score: "1", team2_score: "1"}

    it "should return results table" do
      result = [{:team_id=>1, :goal_for=>8, :goal_against=>8, :won=>2, :lost=>2, :drawn=>2, :points=>8},
               {:team_id=>4, :goal_for=>8, :goal_against=>8, :won=>2, :lost=>2, :drawn=>2, :points=>8},
               {:team_id=>2, :goal_for=>8, :goal_against=>8, :won=>2, :lost=>2, :drawn=>2, :points=>8},
               {:team_id=>3, :goal_for=>8, :goal_against=>8, :won=>2, :lost=>2, :drawn=>2, :points=>8}]
      table = ResultsTable.new season.scores
      expect(result).to eq(table.draw)
    end          

  end
  
end