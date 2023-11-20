# having these be two different classes is a bit janky
# todo: refactor into one "game" class
require_relative "../grid_generation/game_board"

# ::GameBoard.new(width: 10, height: 10, start_x: 5, start_y: 5).print_board
# ::GameBoard.new(width: ARGV[0], height: ARGV[1], start_x: ARGV[2], start_y: ARGV[3]).print_board

class GridMovement
  # board = game_board class
  # pc_location_x and y = number
  def initialize(board:, pc_location_x:, pc_location_y:)
    @board = board
    @pc_location_x = pc_location_x.to_i
    @pc_location_y = pc_location_y.to_i
  end

  def process_input(input)
    puts "processing input"

    # clear current PC
    @board.board[@pc_location_y][@pc_location_x] = ::GameBoard::CELL

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

    # puts @board.board

    @board.board[@pc_location_y][@pc_location_x] = ::GameBoard::PC

    # print the board - this really should just be one class XD
    @board.board.each do |row|
      puts row.join(" ")
    end
  end
end


# Start Script

board = ::GameBoard.new(width: ARGV[0], height: ARGV[1], start_x: ARGV[2], start_y: ARGV[3])
board.print_board
puts "-----------------------------"
puts "commands"
puts "exit: quit the game"
puts "w: move pc up"
puts "a: move pc left"
puts "s: move pc down"
puts "d: move pc right"
puts "press enter to input command"
puts "The world is flat (currently) so don't fall off the edge!"

game = ::GridMovement.new(board: board, pc_location_x: ARGV[2], pc_location_y: ARGV[3])

VALID_COMMANDS = [
  "w", "a", "s", "d",
].freeze

playing = true

while playing
  input = STDIN.gets.chomp

  if input == "exit"
    playing = false
  elsif VALID_COMMANDS.include?(input)
    puts "valid input"
    game.process_input(input)
  else
    puts "not a valid input"
  end
end
