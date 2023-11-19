require "./thing.rb"

# 2022
# 2092 - this one is good
# 2296 or 2299 or 229D - good, easier to read
# 25CB - circle
class Coin < Thing
  COLOR = "93m"
  ICON = " " + ESCAPE + COLOR + "\u25CB" + CLEAR_CODE + " "

  attr_accessor :location_x, :location_y, :icon, :collected

  def initialize(location_x:, location_y:)
    @location_x = location_x.to_i
    @location_y = location_y.to_i

    @icon = ICON
    @collected = false
  end
end
