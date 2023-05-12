# frozen_string_literal: true

require_relative "board"
require_relative "cell"

class GameOfLife
  attr_accessor :size, :initial_board_state, :generations, :board

  def initialize(size: 3, initial_board_state: [[0,0,0],[1,1,1],[0,0,0]], generations: 10)
    self.size = size
    self.initial_board_state = initial_board_state
    self.generations = generations

    self.board = ::Board.new(cells: generate_cells)

    # board class would be comprised of cell classes, and would define the methods
    # in play (calculate, advance, and output) - maybe does all three together?
  end

  def play
    return display_error if invalid_initial_board_state?

    generations.times do |_i|
      calculate_next_generation
      advance_generation
      output_board
    end
  end

  private

  def invalid_initial_board_state?
    initial_board_state.length != size || initial_board_state.any? { |row| row.length != size }
  end

  def display_error
    puts "ERROR --- ERROR"
    puts "Initial State does not match provided size (or default of 3)"
  end

  def generate_cells
    initial_board_state.map do |row|
      row.map do |cell_state|
        ::Cell.new(life_state: ::Cell::VALID_LIFE_STATES[cell_state])
      end
    end
  end

  # move these to board class
  def calculate_next_generation

  end

  def advance_generation

  end
end
