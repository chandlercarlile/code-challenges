# frozen_string_literal: true

class Cell
  attr_accessor :current_state, :future_state

  VALID_LIFE_STATES = ["alive", "dead"]

  def initialize(current_state: "dead")
    self.current_state = current_state

    # better way to handle this?
    output_error unless VALID_LIFE_STATES.include?(current_state)
  end

  def output_error
    puts "ERROR --- ERROR"
    puts "#{current_state} is not a valid life state"
    puts "valid life states are '#{VALID_LIFE_STATES.join("/")}'"
  end

  def alive?
    current_state == "alive"
  end

  def dead?
    current_state == "dead"
  end
end
