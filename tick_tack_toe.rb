class PlayerInfo
    attr_writer :player_number
    def initialize(player_number)
        @player_number = player_number
    end
    def switch_player()
        @player_number = !@player_number
    end
    def player_symbol()
        if @player_number == true
            return symbol = "X"
        elsif @player_number == false
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
    def moves_available() ########################needs a little tunning since used moves can be repeatedly used.
        count = 0
        while count <= 8
            if @move_array[count].class == Fixnum
                moves_avail = true
                count = 9
            else
                count += 1
                moves_avail = false
            end
        end
        return moves_avail
    end
    def match_3_hor()
        count = 0
        match = false
        until count >= 9 do
            if (@move_array[count] == @move_array[count+1]) and (@move_array[count] == @move_array[count+2])
                match = true
                match_point = @move_array[count]
                count = 9
            else
                count += 3
            end
        end
        return match, match_point
    end
    def match_3_vert()
        count = 0
        match = false
        until count >= 9 do
            if (@move_array[count] == @move_array[count+3]) and (@move_array[count] == @move_array[count+6])
                match = true
                match_point = @move_array[count]
                count = 9
            else
                count += 1
            end
        end
        return match, match_point
    end
    def match_3_diag()
        match = false
        if (@move_array[0] == @move_array[4]) and (@move_array[0] == @move_array[8])
            match = true
            match_point = @move_array[0]
        elsif (@move_array[2] == @move_array[4]) and (@move_array[2] == @move_array[6])
            match = true
            match_point = @move_array[2]
        end
        return match, match_point
    end
end

class GameStatus
    def initialize(move_array)
        @move_array = move_array
    end
    def draw()
        game_draw = false
        match_3 = false
        gamestates = GameStates.new(@move_array)
        moves_available = gamestates.moves_available()
        match_3_diag = gamestates.match_3_diag()
        match_3_hor = gamestates.match_3_hor()
        match_3_vert = gamestates.match_3_vert()
        if (match_3_diag[0] == true or match_3_hor[0] == true) or (match_3_vert[0] == true)
            match_3 = true
        end
        if moves_available == false && match_3 == false
            game_draw = true
            puts "Game over. The game ends in a draw."
        end
        return game_draw
    end
    def player_win()
        gamestates = GameStates.new(@move_array)
        match_3_diag_ = gamestates.match_3_diag()
        match_3_hor_ = gamestates.match_3_hor()
        match_3_vert_ = gamestates.match_3_vert()
        if match_3_diag_[0] == true
            win_player_symbol = match_3_diag_[1]
            win_symbol(win_player_symbol)
        elsif match_3_hor_[0] == true
            win_player_symbol = match_3_hor_[1]
            win_symbol(win_player_symbol)
        elsif match_3_vert_[0] == true
            win_player_symbol = match_3_vert_[1]
            win_symbol(win_player_symbol)
        end
    end
    def win_symbol(win_player_symbol)
        if win_player_symbol == "O"
            winner = "Player 2"
        elsif win_player_symbol == "X"
            winner = "Player 1"
        end
        return winner
    end
end

class GamePlay
    attr_writer :move
    @@old_move = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    def initialize(move)
        @move = move
    end
    def bad_move()
        if @move > 9 || @move < 1
            return true
        else
            return false
        end
    end
    def gamestat()
        gamestatus = GameStatus.new(@@old_move)
        draw_ = gamestatus.draw()
        winner = gamestatus.player_win()
        if draw_ == true or winner == "Player 1" or winner == "Player 2"
            return true
        else
            return false
        end
    end
    def move_pos(play)
        playerinfo = PlayerInfo.new(play)
        symbol = playerinfo.player_symbol
        @@old_move[@move-1] = symbol.chomp
        return @@old_move
    end
end

class Screen < GamePlay
    def disp_screen()
        puts "_____________"
        puts "| #{@@old_move[0]} |" + " #{@@old_move[1]} |" + " #{@@old_move[2]} |"
        puts "_____________"
        puts "| #{@@old_move[3]} |" + " #{@@old_move[4]} |" + " #{@@old_move[5]} |"
        puts "_____________"
        puts "| #{@@old_move[6]} |" + " #{@@old_move[7]} |" + " #{@@old_move[8]} |"
        puts "_____________"
    end
end
class GameStart
    class << self
        def start_game()
            gamestat_ = false # Game is still on going
            play = true #Player number true = player 1 false = player 2.
            Screen.new("").disp_screen() #The first screen displayed.
            while  gamestat_ == false
                playerinfo = PlayerInfo.new(play)
                puts "Get input move from user"
                move = gets.chomp.to_i
                gameplay = GamePlay.new(move)
                bad_move_ = gameplay.bad_move()
                move_pos_ = gameplay.move_pos(play)
                gamestatus = GameStatus.new(move_pos_)
                draw_ = gamestatus.draw()
                winner = gamestatus.player_win()
                if bad_move_ == true
                    puts "Invalid move made. Please enter valid move between 1 and 9."
                elsif (bad_move_ == false && draw_ == true)
                    Screen.new("").disp_screen() #Display screen before declaring the game as a draw
                    puts "Game ended in a draw!!!"
                    gamestat_ = true # terminating condition
                    return 
                elsif (bad_move_ == false ) && (winner == "Player 1" or winner == "Player 2") 
                    gamestatus.player_win()
                    gamestat_ = true
                    Screen.new("").disp_screen() #Display screen before declaring the game as a win for one of the players
                    p "Game Over. " + winner + " won the game."
                    return
                elsif (bad_move_ == false && gamestat_ == false) #Yet no winner
                    screen = Screen.new(move)
                    disp = screen.disp_screen()
                    play = playerinfo.switch_player()
                end
            end
        end
    end
end

#######################  Getting the game under way!!!!!!!!!  ###################
GameStart.start_game() 
#######################   THE END!!!!!!! ########################################
