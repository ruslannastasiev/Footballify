module Footballify

  class Championship < ActiveRecord::Base

    attr_accessible :name
    
    has_many :teams, dependent: :destroy
    has_many :seasons
    validates :name, presence: true, length: { maximum: 100 }    

  end

end