require 'spec_helper'

module Footballify

  describe Team do

    it { should validate_presence_of(:name) }  
    it { should ensure_length_of(:name).is_at_most(100) }
    it { should validate_presence_of(:championship) }
    it { should have_many(:team1_scores) }
    it { should have_many(:team2_scores) }

  end

end
