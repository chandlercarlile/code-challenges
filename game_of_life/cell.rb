# frozen_string_literal: true

class Cell
  attr_accessor :life_state, :neighbors

  VALID_LIFE_STATES = ["dead", "alive"]

  def initialize(life_state: "dead", neighbors: 0)
    self.life_state = life_state
    self.neighbors = neighbors

    display_warning unless VALID_LIFE_STATES.include?(life_state)
  end

  def display_warning
    puts "WARNING:"
    puts "#{life_state} is not a valid life state"
    puts "valid life states are '#{VALID_LIFE_STATES.join("/")}'"
  end

  def advance_generation
    self.life_state = meets_conditions_for_life? ? "alive" : "dead"
  end

  def meets_conditions_for_life?
    (neighbors == 3) || (alive? && neighbors == 2)
  end

  def alive?
    life_state == "alive"
  end

  def dead?
    life_state == "dead"
  end
end
