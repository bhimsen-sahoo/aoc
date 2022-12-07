# frozen_string_literal: true

def data
  file = File.open('aoc2021/day2/input.txt')
  file.readlines
end

def dive_position
  horizontal = 0, depth = 0, aim = 0, direction = nil, value = nil

  data.each do |ins|
    direction = ins.split[0]
    value = ins.split[1].to_i

    case direction
    when "forward"
      horizontal += value
      depth += aim * value
    when "down"
      aim += value
    when "up"
      aim -= value
    end
    puts ins
    puts "horizontal: #{horizontal}, depth: #{depth}"
  end

  puts horizontal * depth
end

dive_position
