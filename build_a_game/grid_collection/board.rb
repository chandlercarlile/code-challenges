require "./player_character"

class Board
  CELL = "."

  attr_accessor :grid, :height, :width, :pc

  def initialize(height:, width:)
    @width = width.to_i
    @height = height.to_i

    @pc = nil

    @grid = ::Array.new(@height){::Array.new(@width) {[]}}
  end

  def print_board
    # TODO:
    # - when more objects, and if they have overlap, can check location via stored array

    @grid.each_with_index do |row, index_y|
      row.each_with_index do |column, index_x|
        if @pc.location_x == index_x && @pc.location_y == index_y
          print @pc.icon
        else
          print CELL
        end
        print " "
      end

      puts
    end
  end

  def spawn(type:, location_x: nil, location_y: nil)
    # TODO:
    # - add random if the location is not provided
    # - check if spawn is valid,
    # -- if invalid, output if provided, or re-pick if random

    case type
    when "PlayerCharacter"
      @pc = ::PlayerCharacter.new(location_x: location_x, location_y: location_y)
      @grid[location_y.to_i][location_x.to_i] << @pc
    end
  end

  def move_player_character(distance_x:, distance_y:)
    # TODO:
    # - make a move command, which takes the object that you want to move
    # - this command just calls move with the PC

    # ask pc for current location, and calculate new location
    new_location_x = (@pc.location_x + distance_x) % width
    new_location_y = (@pc.location_y + distance_y) % height

    # check if the player can perform that move on the board
    # - nothing to do here yet, player can move unrestricted

    # if yes, move the character
    @grid[@pc.location_y][@pc.location_x] -= [@pc]

    @pc.location_x = new_location_x
    @pc.location_y = new_location_y

    @grid[new_location_y][new_location_x] << @pc
  end
end
