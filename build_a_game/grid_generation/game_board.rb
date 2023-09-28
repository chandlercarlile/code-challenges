class GameBoard
  CELL = "."
  PC = "@"

  attr_accessor :board

  def initialize(width:, height:, start_x:, start_y:)
    @width = width.to_i
    @height = height.to_i
    @start_x = start_x.to_i
    @start_y = start_y.to_i

    @board = ::Array.new(@height){::Array.new(@width, CELL)}
  end

  def print_board
    @board[@start_y][@start_x] = PC

    @board.each do |row|
      puts row.join(" ")
    end
  end
end

# Initialize and print board

# ::GameBoard.new(width: ARGV[0], height: ARGV[1], start_x: ARGV[2], start_y: ARGV[3]).print_board
