require_relative "dead_cell"
require_relative "live_cell"

class Game
  def initialize(width, height)
    @width = width
    @height = height
    @grid = build_grid
  end

  attr_reader :width, :height, :grid

  def set_live_cell_at x, y
    @grid[y][x] = 1
  end

  def value_at x, y
    alive?(@grid[y][x]) ? LiveCell.new : DeadCell.new
  rescue => e
    puts y, x
  end

  def tick
    new_grid = build_grid

    @grid.each_with_index do |row, y|
      row.each_with_index do |cell, x|
        new_grid[y][x] = begin
          count = live_neighbor_count(x, y)

          if alive?(cell)
            if [2,3].include?(count)
              1
            else
              0
            end
          else
            if [3].include?(count)
              1
            else
              0
            end
          end
        end
      end
    end

    @grid = new_grid
  end

  private

  def build_grid
    Array.new(height) { Array.new(width, 0) }
  end

  def alive?(cell)
    cell == 1
  end

  def live_neighbor_count x, y
    neighbors(x, y).select {|neighbor| alive?(neighbor) }.size
  end

  def neighbors x, y
    top          = {x: x, y: y + 1}
    top_right    = {x: x + 1, y: y + 1}
    right        = {x: x + 1, y: y}
    bottom_right = {x: x + 1, y: y - 1}
    bottom       = {x: x, y: y - 1}
    bottom_left  = {x: x - 1, y: y - 1}
    left         = {x: x - 1, y: y}
    top_left     = {x: x - 1, y: y + 1}

    [top, top_right, right, bottom_right, bottom, bottom_left, left, top_left].map do |coordinate|
      if grid[coordinate[:y]] && grid[coordinate[:y]][coordinate[:x]]
        grid[coordinate[:y]][coordinate[:x]]
      else
        0
      end
    end
  end
end
