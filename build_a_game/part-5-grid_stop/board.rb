require "./player_character"
require "./coin"
require "./box"

class Board
  # CELL = "\u2588\u2588"
  CELL = " . "

  attr_accessor :grid, :height, :width, :score, :movement_errors

  def initialize(player_character:, height:, width:)
    @width = width.to_i
    @height = height.to_i
    @movement_errors = []

    @grid = ::Array.new(@height){::Array.new(@width) {[]}}

    @player_character = player_character
    @grid[@player_character.location_y][@player_character.location_x] << @player_character

    spawn(type: "Coin", count: 3)
    spawn(type: "Box", count: 2)
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

  def spawn(type:, location_x: nil, location_y: nil, count: 1)
    count.times do
      location_x = location_x.nil? ? rand(width) : location_x
      location_y = location_y.nil? ? rand(height) : location_y

      case type
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
  end

  def move_player_character(distance_x:, distance_y:)
    move(moving_thing: @player_character, distance_x: distance_x, distance_y: distance_y)
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
        # collect the static thing and remove it from the board
        moving_thing.collect(static_thing)
        static_thing.collected = true

        @grid[new_location_y][new_location_x] -= [static_thing]
        static_thing.location_x = nil
        static_thing.location_y = nil
      when :pushes
        # recursion here
        has_moved = move(moving_thing: static_thing, distance_x: distance_x, distance_y: distance_y)
        raise "Error moving #{static_thing}" if !has_moved # TODO: this can hide real errors
      when :squishes
        @grid[new_location_y][new_location_x] -= [static_thing]
        static_thing.location_x = nil
        static_thing.location_y = nil
      else
        raise "No interaction Error"
      end
    end

    #interactions were successful, complete the movement, return true
    @grid[current_location_y][current_location_x] -= [moving_thing]
    @grid[new_location_y][new_location_x] << moving_thing

    moving_thing.location_x = new_location_x
    moving_thing.location_y = new_location_y

    @movement_errors = []
    return true

    # interactions were not successful, no movement, return false
  rescue => e
    @movement_errors << e
    return false
  end
end
