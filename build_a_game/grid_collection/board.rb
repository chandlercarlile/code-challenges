require "./player_character"

class Board
  CELL = "."

  attr_accessor :grid, :height, :width

  def initialize(height:, width:, pc_start_x:, pc_start_y:)
    @width = width.to_i
    @height = height.to_i

    @grid = ::Array.new(@height){::Array.new(@width) {[]}}

    spawn(type: "PlayerCharacter", location_x: pc_start_x, location_y: pc_start_y)
  end

  def print_board
    @grid.each do |row|
      row.each do |column|
        if column.empty?
          print CELL
        else
          # eventually might need to handle overlapping items
          # for now, only 1 item will ever be on a space
          print column.first.icon
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
