require 'spec_helper'

module Footballify
  describe Season do
    it { should have_many(:scores) }
    it { should belong_to(:championship) }
  end
end
