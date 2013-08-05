module Footballify

  class SeasonDrawer

    def initialize(teams = [])
      @teams = teams
      @teams << 0 if @teams.count.odd?
    end 
    
    def left_array
      @left_array ||= @teams.first(@teams.count / 2)
    end

    def right_array
      @right_array ||= @teams.drop(@teams.count / 2).reverse
    end

    def use_scores_with_hash
      round = 1
      @count = @teams.count / 2    
      left_column = left_array
      right_column = right_array
      result = []
      result << record_to_hash(left_array, right_array, round)
      
      (2 * @count - 2).times do      
        #debugger
        first_team = left_column[0]     
        left_buffer = left_column[1..-1]

        right_column.unshift(left_buffer.shift)
        left_buffer.push(right_column.pop)
        left_buffer.unshift(first_team)      
        
        left_column = left_buffer
        round += 1

        result << record_to_hash(left_column, right_column, round)

      end

      result.flatten

    end


    def record_to_hash(left_column, right_column, round)
      
      result = []
      (0..(@count - 1)).each do |i|
        result << { 
          team1_id: left_column[i], 
          team2_id: right_column[i], 
          round: round 
        } << 
        { 
          team1_id: right_column[i], 
          team2_id: left_column[i], 
          round: round + @count * 2 - 1
        }     
      end

      result

    end

    def use_scores_with_yield
      use_scores_with_hash.each do |res|
        team1_id = res[:team1_id]
        team2_id = res[:team2_id]
        round    = res[:round]     
        yield(team1_id, team2_id, round)
      end    
    end

  end

end