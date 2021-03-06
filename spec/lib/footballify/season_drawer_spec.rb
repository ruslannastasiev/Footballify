require 'spec_helper'

module Footballify

  describe "SeasonDrawer" do    

    describe "listing teams in scores, for odd teams.count" do      

      it "should return the hash with scores combination" do
        drawer = SeasonDrawer.new [1, 2, 3]
        scores = drawer.draw
        result = [{team1_id: 1, team2_id: 0, round: 1},
                 {team1_id: 0, team2_id: 1, round: 4},
                 {team1_id: 2, team2_id: 3, round: 1},
                 {team1_id: 3, team2_id: 2, round: 4},
                 {team1_id: 1, team2_id: 2, round: 2},
                 {team1_id: 2, team2_id: 1, round: 5},
                 {team1_id: 3, team2_id: 0, round: 2},
                 {team1_id: 0, team2_id: 3, round: 5},
                 {team1_id: 1, team2_id: 3, round: 3},
                 {team1_id: 3, team2_id: 1, round: 6},
                 {team1_id: 0, team2_id: 2, round: 3},
                 {team1_id: 2, team2_id: 0, round: 6}]
        expect(scores).to eq(result)
      end

    end

    describe "listing teams in scores, for pair teams.count" do      

      it "should return the hash with scores combination" do
        drawer = SeasonDrawer.new [1, 2, 3, 4]
        scores = drawer.draw
        result = [{team1_id: 1, team2_id: 4, round: 1},
                 {team1_id: 4, team2_id: 1, round: 4},
                 {team1_id: 2, team2_id: 3, round: 1},
                 {team1_id: 3, team2_id: 2, round: 4},
                 {team1_id: 1, team2_id: 2, round: 2},
                 {team1_id: 2, team2_id: 1, round: 5},
                 {team1_id: 3, team2_id: 4, round: 2},
                 {team1_id: 4, team2_id: 3, round: 5},
                 {team1_id: 1, team2_id: 3, round: 3},
                 {team1_id: 3, team2_id: 1, round: 6},
                 {team1_id: 4, team2_id: 2, round: 3},
                 {team1_id: 2, team2_id: 4, round: 6}]
        expect(scores).to eq(result)
      end
      
    end
    
  end

end