class Game
  CELL = "."
  PC = "@"

  VALID_COMMANDS = [
    "w", "a", "s", "d",
  ].freeze

  attr_accessor :print_board, :process_input

  def initialize(width:, height:, start_x:, start_y:)
    @width = width.to_i
    @height = height.to_i
    @pc_location_x = start_x.to_i
    @pc_location_y = start_y.to_i

    @board = ::Array.new(@height){::Array.new(@width, CELL)}
  end

  def play
    playing = true

    while playing
      print_board
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
        puts "valid input"
        process_input(input)
      else
        puts "not a valid input"
      end
    end
  end

  private

  def print_board
    @board.each_with_index do |row, index_y|
      row.each_with_index do |column, index_x|
        if @pc_location_x == index_x && @pc_location_y == index_y
          print PC
        else
          print CELL
        end
        print " "
      end

      puts
    end
  end

  def process_input(input)
    case input
    when "w"
      @pc_location_y -= 1
    when "a"
      @pc_location_x -= 1
    when "s"
      @pc_location_y += 1
    when "d"
      @pc_location_x += 1
    end

    @pc_location_x %= @width
    @pc_location_y %= @height
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
