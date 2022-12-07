# frozen_string_literal: true

def data
  file = File.open('aoc2021/day1/input.txt')
  file.read.split
end

def find_increase_count
  acc = data[0]
  count = 0
  data[1..-1].each do |i|
    count += 1 if acc.to_i < i.to_i
    acc = i
  end
  count
end

puts find_increase_count
