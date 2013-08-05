module Footballify

  class ResultsTable

    def initialize(scores = nil)
      @scores = scores  
    end

    def scores_table
      @scores_table ||= @scores.map do |score|
        [
          score.team1_id,
          score.team2_id,
          score.team1_score,
          score.team2_score 
        ]
      end
    end

    def calculate(first, second)
      @goal_for += first
      @goal_against += second  
      @won += 1 if first > second
      @lost += 1 if first < second
      @drawn += 1 if first == second
      [@goal_for, @goal_against, @won, @lost, @drawn]
    end

    def draw      
      points_table = []
      @goal_for = @goal_against = @won = @lost = @drawn = points = i = 0  

      scores_table.each do |first_scores|
        
        scores_table.each do |score|  
          if score[2] && score[3] && first_scores[0] == score[0]
            calculate(score[2], score[3])
          end

          if score[2] && score[3] && first_scores[0] == score[1]
            calculate(score[3], score[2])
          end                   
        end

        points_table << { team_id: first_scores[0], 
          goal_for: @goal_for, 
          goal_against: @goal_against,
          won: @won,
          lost: @lost,
          drawn: @drawn,
          points: @won*3 + @drawn 
        }
        i += 1
        @goal_for = @goal_against = @won = @lost = @drawn = points = 0
        break if i == scores_table.count / 4 + 1 
      end
      
      points_table
    end  

  end

end