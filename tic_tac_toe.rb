class Game
  attr_accessor :board
  attr_reader :player1_xo, :player2_xo, :separator
  def initialize (player1, player2)
    @board = [0,1,2,3,4,5,6,7,8]
    @separator = "-*-*-"
    @player1 = player1
    @player2 = player2 
    @player1_xo = ["X","O"].sample
    if player1_xo == "X"
      @player2_xo = "O"
    else
      @player2_xo = "X"
    end 
  end
  def show_board
    puts @board.take(3).join('|')
    puts @separator
    puts @board.slice(3,3).join('|')
    puts @separator
    puts @board.slice(6,3).join('|')
  end

  def player_move(player,position)
    @wins = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    if player == @player1
      if @board[position].is_a? Integer
        @board[position] = @player1_xo
        player.moves.push(position)
        puts "\n"
        puts "#{player.name} has played at position #{position}" 
        puts "\n"
        if @wins.include?(player.moves)
          puts "#{player.name} wins!"
          puts "\n"
        end
        return show_board
      else
        puts "\n"
        puts "Space is already taken. Choose another position"
      end
    else
      if @board[position].is_a? Integer
        @board[position] = @player2_xo
        player.moves.push(position)
        puts "\n"
        puts "#{player.name} has played at position #{position}" 
        puts "\n"
        if @wins.include?(player.moves)
          puts "#{player.name} wins!"
          puts "\n"
        end
        return show_board
      else
        puts "\n"
        puts "Space is already taken. Choose another position"
      end
    end
  end
end

class Player
  attr_accessor :name, :moves
  def initialize(name)
    @name = name
    @moves = []
  end
end

player1 = Player.new("Player 1")
player2 = Player.new("Player 2")
Game_1 = Game.new(player1, player2)
Game_1.show_board
Game_1.player_move(player1, 2)
Game_1.player_move(player2, 0)
Game_1.player_move(player1, 4)
Game_1.player_move(player2, 4)
Game_1.player_move(player2, 5)
Game_1.player_move(player1, 6)

