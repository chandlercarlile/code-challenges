class PlayerCharacter
  ICON = "@"

  attr_accessor :location_x, :location_y

  def initialize(location_x:, location_y:)
    @location_x = location_x.to_i
    @location_y = location_y.to_i

    @icon = ICON
  end

  def icon
    @icon
  end
end
