require "./player_character"
require "./coin"
require "./box"

class Board
  CELL = "."

  attr_accessor :grid, :height, :width, :score

  def initialize(height:, width:, pc_start_x:, pc_start_y:)
    @width = width.to_i
    @height = height.to_i
    # should the board keep track of the score?
    @score = 0

    @grid = ::Array.new(@height){::Array.new(@width) {[]}}

    spawn(type: "PlayerCharacter", location_x: pc_start_x, location_y: pc_start_y)
    # TODO:
    # - more than one coin can spawn?
    spawn(type: "Coin")
    spawn(type: "Box")
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
    # - keep track of if the location was provided or random (need to error if provided and invalid)
    location_x = location_x.nil? ? rand(width) : location_x
    location_y = location_y.nil? ? rand(height) : location_y

    case type
    when "PlayerCharacter"
      # if player character is ever not the first to spawn, will need to validate the location
      @pc = ::PlayerCharacter.new(location_x: location_x, location_y: location_y)
      @grid[location_y.to_i][location_x.to_i] << @pc
    when "Coin"
      if @grid[location_y.to_i][location_x.to_i].empty?
        @coin = ::Coin.new(location_x: location_x, location_y: location_y)
        @grid[location_y.to_i][location_x.to_i] << @coin
      else
        spawn(type: "Coin")
      end
    when "Box"
      if @grid[location_y.to_i][location_x.to_i].empty?
        @box = ::Box.new(location_x: location_x, location_y: location_y)
        @grid[location_y.to_i][location_x.to_i] << @box
      else
        spawn(type: "Box")
      end
    end
  end

  def move_player_character(distance_x:, distance_y:)
    # assume that the player can only move one space at a time
    # this is a helper to get direction as human readable
    direction =
      distance_x == 1 ? "e" :
      distance_x == -1 ? "w" :
      distance_y == 1 ? "n" :
      distance_y == -1 ? "s" :
      "?"

    # TODO:
    # - make a move command, which takes the object that you want to move
    # - this command just calls move with the PC

    # ask pc for current location, and calculate new location
    new_location_x = (@pc.location_x + distance_x) % width
    new_location_y = (@pc.location_y + distance_y) % height

    # check if the player can perform that move on the board
    # - nothing to do here yet, player can move unrestricted
    # - easy way to do this, check everything else on that tile for "movable" or "collectible"
    # - for boxes/things that can be pushed in a chain, check each thing for "movable", else revert

    # if yes, move the character
    @grid[@pc.location_y][@pc.location_x] -= [@pc]

    @pc.location_x = new_location_x
    @pc.location_y = new_location_y

    @grid[new_location_y][new_location_x] << @pc

    items = @grid[new_location_y][new_location_x]

    # collect anything that is "collectible" & move anything that is "movable"
    # - this may be easier if we have the direction the player was moving (as an argument)
    # - otherwise we will need to calculate it
    items.each do |item|
      next if item == @pc

      if item == @coin
        @score += 1
        @grid[new_location_y][new_location_x] -= [@coin]
        spawn(type: "Coin")
      end

      if item == @box
        # calculate new box location
        new_box_location_x = (new_location_x + distance_x) % width
        new_box_location_y = (new_location_y + distance_y) % height

        # check if box can be moved there
        # - nothing to do here, box can move unrestricted
        # - eventually this can be a more "global" method, where you pass the item to move
        # - and the board tells you if it can move there or not

        # check if box ran over the coin
        # - if so, subtract score and spawn new coin
        if @grid[new_box_location_y][new_box_location_x] == [@coin]
          @score -= 1
          @grid[new_box_location_y][new_box_location_x] -= [@coin]
          spawn(type: "Coin")
        end

        # now that the space is for sure empty, we move the box
        @grid[new_location_y][new_location_x] -= [@box]
        @box.location_x = new_box_location_x
        @box.location_y = new_box_location_y
        @grid[new_box_location_y][new_box_location_x] << @box
      end
    end
  end
end
