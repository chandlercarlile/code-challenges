# frozen_string_literal: true

class Board
  attr_accessor :cells

  def initialize(cells: [[]])
    self.cells = cells
  end

  # - go through each cell, count it's neighbors. update the count.
  # - go through again, this time updating alive/dead and ressetting neighbor count
end
