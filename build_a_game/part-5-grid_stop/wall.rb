require "./thing.rb"

class Wall < Thing
  ICON = "\u2592" + "\u2592" + "\u2592"

  attr_accessor :location_x, :location_y, :icon

  def initialize(location_x:, location_y:)
    @location_x = location_x.to_i
    @location_y = location_y.to_i

    @icon = ICON
  end
end
