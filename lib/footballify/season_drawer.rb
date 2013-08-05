module Footballify

  class SeasonDrawer

    def initialize(teams = [])
      @teams = teams
      @teams << 0 if @teams.count.odd?
      @count = @teams.count
      @team_pairs_count = @count / 2
      @total_rounds = @count - 2
    end 
    
    def left_array
      @left_array ||= @teams.first(@team_pairs_count)
    end

    def right_array
      @right_array ||= @teams.drop(@team_pairs_count).reverse
    end

    def draw(&block)
      round = 1
      left_column = left_array
      right_column = right_array
      result = []
      result << create_pairs(left_array, right_array, round, &block)
      
      @total_rounds.times do      
        first_team = left_column[0]     
        left_buffer = left_column[1..-1]

        right_column.unshift(left_buffer.shift)
        left_buffer.push(right_column.pop)
        left_buffer.unshift(first_team)      
        
        left_column = left_buffer
        round += 1

        result << create_pairs(left_column, right_column, round, &block)

      end

      result.flatten
    end

    def create_pairs(left_column, right_column, round, &block)
      result = []
      
      0.upto(@team_pairs_count - 1) do |i|
        pair = { 
          team1_id: left_column[i], 
          team2_id: right_column[i], 
          round: round 
        }
        reverse_pair = { 
          team1_id: right_column[i], 
          team2_id: left_column[i], 
          round: round + @count - 1
        }
        result << pair << reverse_pair
        
        if block
          block.call(pair[:team1_id], pair[:team2_id], pair[:round])
          block.call(reverse_pair[:team1_id], reverse_pair[:team2_id], reverse_pair[:round])
        end
      end

      result
    end

  end

end