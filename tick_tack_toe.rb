class TickTackToe
    attr_reader :player_pick
    def initialize(player_pick = gets.chomp)
      @player_no = true #true for player 1
      @player_pick = player_pick
      @old_game = []
      @winner = []
    
    end

end

class PlayerChoices < TickTackToe
    def player_coice()
        if @player_no == true
            player_symbol = "X"
            return player_symbol
            p old_game

        elsif @player_no == false
            player_symbol = "O"
            return player_symbol
            p old_game

        end
    
    end

end

class Screen < PlayerChoices
    def disp_screen()
        puts "_____________"
        puts "| #{   top_left} |" + " #{   top_center} |" + " #{   top_right} |"
        puts "_____________"
        puts "| #{middle_left} |" + " #{middle_center} |" + " #{middle_right} |"
        puts "_____________"
        puts "| #{bottom_left} |" + " #{bottom_center} |" + " #{bottom_right} |"
        puts "_____________"
    
    end
    
end

class PlayerMove < PlayerChoices
    def player_selection()
        @old_game = []
        available_moves()
        if @avail_move.include?(@player_pick)
            if @player_pick == 1
                top_left = player_coice(@player_no)
                @old_game[@player_pick-1] = player_coice()
                
            elsif @player_pick == 2
                top_center = player_coice(@player_no)
                @old_game[@player_pick-1] =  player_coice()

            elsif @player_pick == 3
                top_right = player_coice(@player_no)
                @old_game[@player_pick-1] =  player_coice()

            elsif @player_pick == 4
                middle_left = player_coice(@player_no)
                @old_game[@player_pick-1] =  player_coice()

            elsif @player_pick == 5
                middle_center = player_coice(@player_no)
                @old_game[@player_pick-1] =  player_coice()

            elsif @player_pick == 6
                middle_right = player_coice(@player_no)
                @old_game[@player_pick-1] =  player_coice()

            elsif @player_pick == 7
                bottom_left = player_coice(@player_no)
                @old_game[@player_pick-1] =  player_coice()

            elsif @player_pick == 8
                bottom_center = player_coice(@player_no)
                @old_game[@player_pick-1] =  player_coice()

            elsif @player_pick == 9
                bottom_right = player_coice(@player_no)
                @old_game[@player_pick-1] =  player_coice()

            else
                puts "Player input move not recognised, please play a regognised move. Recodnised moves being 0 to 10"

            end

        end

        return @old_game

    end

end

class GamePlay < Screen
    def self.playgame()
        if @old_game.nil? != true
            until (@old_game.length > 9) | (match_three() == true) do
                disp_screen()

            end

        else

        end

    end

    def match_three()
        if (@old_game[0] == @old_game[3]) && (@old_game[0] == @old_game[6])
            @winner = @old_game[0]
            return true

        elsif (@old_game[1] == @old_game[4]) && (@old_game[1] == @old_game[7])
            @winner[0] = @old_game[1]
            return true

        elsif (@old_game[2] == @old_game[5]) && (@old_game[2] == @old_game[8])
            @winner[0] = @old_game[2]
            return true

        elsif (@old_game[0] == @old_game[1]) && (@old_game[0] == @old_game[2])
            @winner[0] = @old_game[0]
            return true

        elsif (@old_game[3] == @old_game[4]) && (@old_game[3] == @old_game[5])
            @winner[0] = @old_game[3]
            return true

        elsif (@old_game[6] == @old_game[7]) && (@old_game[6] == @old_game[8])
            @winner[0] = @old_game[6]
            return true

        elsif (@old_game[0] == @old_game[4]) && (old_game[0] == @old_game[8])
            @winner = @old_game[0]
            return true

        elsif (@old_game[2] == @old_game[4]) && (@old_game[2] == @old_game[6])
            @winner = @old_game[2]
            return true

        else
            return false

        end

    end

    def pausegame()
        puts @old_game
        puts "Game paused!"
        return @game_on = false, @old_game

    end

    def playgame()
        while @game_on == true
            if (@player_pick.upcase == "S") | (@player_pick.upcase == "STOP") 
                if @player_no == true
                    puts "Game Over! Player #{2} won the game"
                    break

                elsif @player_no == false
                    puts "Game Over! Player #{2} won the game"
                    break 

                else
                    puts "Game over! Player quiting not specified."

                end

            elsif @old_game.length == 9
                puts "Game Over. Draw"
                break #if @old_game.length == 9

            elsif match_three() == true
                p @winner

            elsif (@player_pick.upcase == "P") | (@player_pick.upcase == "PAUSE")
                pausegame()

            end

            switch_player()

        end

    end

    def switch_player()
        @player_no = !@player_no

    end

    def available_moves()
        @old_game.select.with_index { |avail_move, idx| idx.nil? }
        return avail_move
        
    end

end

#super is useful for instance variables
#new_game = TickTackToe.new(1,1)

play_game_ = GamePlay.playgame

###new code
class PlayerInfo
    attr_writer :player_number
    def initialize(player_number)
        @player_number = player_number
    end
    def switch_player()
        @player_number = !@player_number
    end
    def player_symbol(player_number)
        if player_number == 1
            return symbol = "X"
        elsif player_number == 2
            return symbol = "O"
        else
            "Player number should be between 1 and 2"
            return
        end
    end
end

class GameStates
    attr_writer :move_array
    def initialize(move_array)
        @move_array = move_array
    end
    def moves_available()
        if @move_array.length < 9
            moves_avail = true
        elsif (@move_array.include? nil) == true
            moves_avail = true
        elsif (@move_array.include? nil) == false
            moves_avail = false
        end
        return moves_avail
    end
    def match_3_hor()
        count = 0
        match = false
        until count >= 8 do
            if @move_array[count] == @move_array[count+1] and @move_array[count] == @move_array[count + 2]
                match = true
                count = 8
            else
                count += 3
            end
        end
        return match, @move_array[count]
    end
    def match_3_vert()
        count = 0
        match = false
        until count >= 8 do
            if @move_array[count] == @move_array[count+3] and @move_array[count] == @move_array[count + 6]
                match = true
                count = 8
            else
                count += 3
            end
        end
        return match, @move_array[count]
    end
    def match_3_diag()
        count = 0
        match = false
        if @move_array[count] == @move_array[count+4] and @move_array[count] == @move_array[count+8]
            match = true
        elsif @move_array[count+2] == @move_array[count+4] and @move_array[count+2] == @move_array[count+6]
            match = true
        end
        return match, @move_array[count]
    end
end

class GameStatus
    def draw()
        move_array = [1, 2, 4, 8, 5, 6, 7, 8 ,9]
        game_draw = false
        match_3 = false
        gamestates = GameStates.new(move_array)
        moves_available = gamestates.moves_available()
        match_3_diag = gamestates.match_3_diag()
        match_3_hor = gamestates.match_3_hor()
        match_3_vert = gamestates.match_3_vert()
        if match_3_diag[0] == true or match_3_hor[0] == true or match_3_vert[0] == true
            match_3 = true
        end
        if moves_available == false and match_3 == false
            game_draw = true
            puts "Game over. The game ends in a draw."
        end
        return game_draw
    end
    def player_win()
        move_array = ["O", "O", "O", "O", "O", "O", "O", "O" ,"O"]
        match_3 = false
        gamestates = GameStates.new(move_array)
        match_3_diag_ = gamestates.match_3_diag()
        match_3_hor_ = gamestates.match_3_hor()
        match_3_vert_ = gamestates.match_3_vert()
        if match_3_diag_[0] == true
            win_player_symbol = match_3_diag_[1]
        elsif match_3_hor_[0] == true
            win_player_symbol = match_3_hor_[1]
        elsif match_3_vert_[0] == true
            win_player_symbol = match_3_vert_[1]
        end
        if win_player_symbol == "O"
            winner = "Player 2"
        elsif win_player_symbol == "X"
            winner = "Player 1"
        end
        return winner
    end
end
