# frozen_string_literal: true

def data
  file = File.open('aoc2021/day2/input.txt')
  file.readlines
end

def dive_position
  horizontal = 0
  depth = 0
  direction = nil
  value = nil

  data.each do |ins|
    direction = ins.split[0]
    value = ins.split[1].to_i

    case direction
    when "forward"
      horizontal += value
    when "down"
      depth += value
    when "up"
      depth -= value
    end
  end

  horizontal * depth
end

pp dive_position



class Submarine
  attr_accessor :position

  def update_position
    
  end

  def initialize
    @positions = 0
    @instructions = [];
  end
end

