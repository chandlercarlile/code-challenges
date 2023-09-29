require "./board.rb"

class Game
  VALID_COMMANDS = [
    "w", "a", "s", "d",
  ].freeze

  def initialize(height:, width:, start_x:, start_y:)
    @board = ::Board.new(height: height, width: width, start_x: start_x, start_y: start_y)
  end

  def play
    playing = true

    loop do
      @board.print_board
      puts "-----------------------------"
      puts "commands"
      puts "exit: quit the game"
      puts "w: move pc up"
      puts "a: move pc left"
      puts "s: move pc down"
      puts "d: move pc right"
      puts "press enter to input command"

      input = STDIN.gets.chomp
      system("clear")

      if input == "exit"
        playing = false
      elsif VALID_COMMANDS.include?(input)
        process_input(input)
      end

      break if !playing
    end
  end

  private

  def process_input(input)
    case input
    when "w"
      @board.pc_location_y -= 1
    when "a"
      @board.pc_location_x -= 1
    when "s"
      @board.pc_location_y += 1
    when "d"
      @board.pc_location_x += 1
    end

    @board.pc_location_x %= @board.width
    @board.pc_location_y %= @board.height
  end
end

# using ruby in cli
# ruby game.rb 10 10 5 5
# uncomment the below lines
# system("clear")
# game = ::Game.new(width: ARGV[0], height: ARGV[1], start_x: ARGV[2], start_y: ARGV[3]).play

#####################################

# using IRB
# irb -r ./game.rb
# ::Game.new(width: 10, height: 10, start_x: 5, start_y: 5).play
