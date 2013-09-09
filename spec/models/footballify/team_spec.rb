require 'spec_helper'

module Footballify

  describe Team do

    let(:championship) { create (:championship) }
    let(:team1) { create :team }
    let(:team2) { create :team }  
    let!(:score1) { create :score, team1_id: team1.id, team2_id: team2.id, team1_score: "3", team2_score: "1" }
    let!(:score2) { create :score, team1_id: team1.id, team2_id: team2.id, team1_score: "4", team2_score: "2" }
    let!(:score3) { create :score, team1_id: team1.id, team2_id: team2.id, team1_score: "3", team2_score: "3" }
    let!(:score4) { create :score, team1_id: team2.id, team2_id: team1.id, team1_score: "3", team2_score: "2" }
    let!(:score5) { create :score, team1_id: team2.id, team2_id: team1.id, team1_score: "3", team2_score: "1" }
    let!(:score6) { create :score, team1_id: team2.id, team2_id: team1.id, team1_score: "2", team2_score: "2" }

    it { should validate_presence_of(:name) }  
    it { should ensure_length_of(:name).is_at_most(100) }
    it { should validate_presence_of(:championship) }
    it { should have_many(:team1_scores) }
    it { should have_many(:team2_scores) }
  end

end
