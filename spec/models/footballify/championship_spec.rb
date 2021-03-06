require 'spec_helper'

module Footballify

  describe Championship do

    it { should validate_presence_of(:name) }    
    it { should ensure_length_of(:name).is_at_most(100) }    
    it { should have_many(:teams) }
    
  end
  
end
