require 'spec_helper'

module Footballify

  describe Score do

    it { should belong_to(:team1) }
    it { should belong_to(:team2) }

  end
  
end
