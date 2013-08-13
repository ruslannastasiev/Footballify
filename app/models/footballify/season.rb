require "footballify/season_drawer"
module Footballify

  class Season < ActiveRecord::Base

    attr_accessible :start_date, :description, :championship_id
    has_many :scores
    belongs_to :championship

    def start_season      
      drawer = SeasonDrawer.new championship.teams.map(&:id)
      drawer.draw { |left_column, right_column, round| self.scores.create! team1_id: left_column, team2_id: right_column, round: round }
    end

  end
  
end