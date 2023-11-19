require "./player_character"
require "./coin"
require "./box"

class Board
  # CELL = "\u2588\u2588"
  CELL = " . "

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
    move(moving_thing: @pc, distance_x: distance_x, distance_y: distance_y)
  end

  def move(moving_thing:, distance_x:, distance_y:)
    current_location_x = moving_thing.location_x
    current_location_y = moving_thing.location_y

    # calculate new location
    new_location_x = (current_location_x + distance_x) % width
    new_location_y = (current_location_y + distance_y) % height

    # interact with all the things at the new location
    new_things = @grid[new_location_y][new_location_x]

    new_things.each do |static_thing|
      interaction = moving_thing.interact(static_thing)

      case interaction
      when :collects
        # inventory, or each thing defines how to "collect" the static thing
        moving_thing.collect(static_thing)
      when :pushes
        # recursion here
        has_moved = move(moving_thing: static_thing, distance_x: distance_x, distance_y: distance_y)
        raise "Error moving #{static_thing}" if !has_moved
      when :squishes
        # implement despawn method? To handle each thing in its own case.
        # ex. if a coin is squished, should we spawn another one?
        @grid[new_location_y][new_location_x] -= [static_thing]
        static_thing.location_x = nil
        static_thing.lcoation_y = nil
      else
        raise "No interaction Error"
      end
    end

    #interactions were successful, complete the movement, return true
    @grid[location_y][location_x] -= [moving_thing]
    @grid[new_location_y][new_location_x] << moving_thing

    moving_thing.location_x = new_location_x
    moving_thing.location_y = new_location_y

    return true

    # interactions were not successful, no movement, return false
  rescue
    return false
  end
end
