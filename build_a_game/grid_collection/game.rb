class Game
  CELL = "."
  PC = "@"

  attr_accessor :board

  def initialize(width:, height:, start_x:, start_y:)
    @width = width.to_i
    @height = height.to_i
    @pc_location_x = start_x.to_i
    @pc_location_y = start_y.to_i

    @board = ::Array.new(@height){::Array.new(@width, CELL)}
  end

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
    puts "processing input"

    # move the PC
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

    print_board
  end
end

# Start Script

game = ::Game.new(width: ARGV[0], height: ARGV[1], start_x: ARGV[2], start_y: ARGV[3])
game.print_board
puts "-----------------------------"
puts "commands"
puts "exit: quit the game"
puts "w: move pc up"
puts "a: move pc left"
puts "s: move pc down"
puts "d: move pc right"
puts "press enter to input command"
puts "The world is flat (currently) so don't fall off the edge!"

VALID_COMMANDS = [
  "w", "a", "s", "d",
].freeze

playing = true

while playing
  input = STDIN.gets.chomp
  system("clear")

  if input == "exit"
    playing = false
  elsif VALID_COMMANDS.include?(input)
    puts "valid input"
    game.process_input(input)
  else
    puts "not a valid input"
  end
end
