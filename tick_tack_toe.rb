class TickTackToe
    include PlayerMove
    attr_reader :player_pick
    attr_reader :player_no
    def initialize(player_no, player_pick)
      @player_no = player_no
      @player_pick = player_pick
      $old_game = {}
    
    end

end

class PlayerChoices < TickTackToe
    def player_coice(player_no)
        if player_no == 1
            player_symbol = "X"
            return player_symbol
            p old_game

        elsif player_no == 2
            player_symbol = "O"
            return player_symbol
            p old_game

        else
            puts "Please enter valid plater number. Options are 1 or 2"

        end
    
    end

    private

end

class Screen < PlayerChoices
    def disp_screen
        p "| #{   top_left} |" + " #{   top_center} |" + " #{   top_right} |"
        p "| #{middle_left} |" + " #{middle_center} |" + " #{middle_right} |"
        p "| #{bottom_left} |" + " #{bottom_center} |" + " #{bottom_right} |"
    
    end
    
end

class PlayerMove < PlayerChoices
    def player_selection(player_pick)
        old_game = []
        if player_pick == 1
            top_left = player_coice(player_no)
            old_game[player_pick-1] = player_symbol
            
        elsif player_pick == 2
            top_center = player_coice(player_no)
            old_game[player_pick-1] = player_symbol

        elsif player_pick == 3
            top_right = player_coice(player_no)
            old_game[player_pick-1] = player_symbol

        elsif player_pick == 4
            middle_left = player_coice(player_no)
            old_game[player_pick-1] = player_symbol

        elsif player_pick == 5
            middle_center = player_coice(player_no)
            old_game[player_pick-1] = player_symbol

        elsif player_pick == 6
            middle_right = player_coice(player_no)
            old_game[player_pick-1] = player_symbol

        elsif player_pick == 7
            bottom_left = player_coice(player_no)
            old_game[player_pick-1] = player_symbol

        elsif player_pick == 8
            bottom_center = player_coice(player_no)
            old_game[player_pick-1] = player_symbol

        elsif player_pick == 9
            bottom_right = player_coice(player_no)
            old_game[player_pick-1] = player_symbol

        else
            puts "Player input move not recognised, please play a regognised move. Recodnised moves being 0 to 10"

        end

    end

end


#super is useful for instance variables
new_game = TickTackToe.new(1,1)