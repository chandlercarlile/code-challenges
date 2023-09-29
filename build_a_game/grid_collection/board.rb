class Board
  CELL = "."
  PC = "@"

  attr_accessor :board, :height, :width, :pc_location_x, :pc_location_y

  def initialize(height:, width:, start_x:, start_y:)
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
end
