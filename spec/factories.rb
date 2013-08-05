FactoryGirl.define do
  
  factory :championship, :class => Footballify::Championship do |championship|
    championship.name  "ua"    
  end

  factory :team, :class => Footballify::Team do |team|
   sequence(:name) {|n| "team #{n}"}
   championship
  end

  factory :score, :class => Footballify::Score do |score|
  end

  factory :season, :class => Footballify::Season do 
    sequence(:start_date) {|n| "201 #{n}"}
    description  "uachamp"    
  end
  
end