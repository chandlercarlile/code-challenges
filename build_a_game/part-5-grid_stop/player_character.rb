require "./thing.rb"

# {1F60E} - sunglasses
# 263A - smiley (hard to read)
# 1330 - Ethiopic Syllable Pha
# {13020} - Heiroglyphic person
class PlayerCharacter < Thing
  COLOR = "37m"
  ICON = " " + ESCAPE + COLOR + "\u{13020}" + CLEAR_CODE + " "

  attr_accessor :location_x, :location_y, :icon

  def initialize(location_x:, location_y:)
    @location_x = location_x.to_i
    @location_y = location_y.to_i

    @icon = ICON

    @inventory = []
  end

  def interact(thing)
    case thing.class.name.to_sym
    when :Coin
      :collects
    when :Box
      :pushes
    end
  end

  def collect(thing)
    @inventory << thing
  end

  def score
    @inventory.count { |thing| thing.class.name.to_sym == :Coin }
  end
end
