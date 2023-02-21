# frozen_string_literal: true

class GameOfLife
  attr_accessor :size, :initial_state, :generations

  def initialize(size: 3, initial_state: [[0,0,0],[1,1,1],[0,0,0]], generations: 10)
    self.size = size
    self.initial_state = initial_state
    self.generations = generations

    # maybe put a board class here? And pass in initial state to that class
    # board class would be comprised of cell classes. And would define the methods
    # in play (calculate, advance, and output)
    # board class might have a method that does those three together?

    # cell has alive/dead attribute, and a count of its neighbors attribute

    # - go through each cell, count it's neighbors. update the count.
    # - go through again, this time updating alive/dead and ressetting neighbor count
    # - repeat
  end

  def play
    return display_error if invalid_initial_state?

    generate_cells

    generations.times do |_i|
      calculate_next_generation
      advance_generation
      output_board
    end
  end

  private

  def invalid_initial_state?
    initial_state.length != size || initial_state.any? { |row| row.length != size }
  end

  def display_error
    puts "ERROR --- ERROR"
    puts "Initial State does not match provided size (or default of 3)"
  end

  def generate_cells

  end

  def calculate_next_generation

  end

  def advance_generation

  end
end
