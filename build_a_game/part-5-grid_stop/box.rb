require "./thing.rb"

# 229F
# 25A1 - square
# 25A2 - square w/rounded corners
# 25FB - medium square
# 25FC - filled medium square
# 3248 - number boxes? weights???
class Box < Thing
  COLOR = "33m"
  ICON = " " + ESCAPE + COLOR + "\u25A1" + CLEAR_CODE + " "

  attr_accessor :location_x, :location_y, :icon

  def initialize(location_x:, location_y:)
    @location_x = location_x.to_i
    @location_y = location_y.to_i

    @icon = ICON
  end

  def interact(thing)
    case thing.class.name.to_sym
    when :Coin
      :squishes
    when :Box
      :pushes
    end
  end
end
