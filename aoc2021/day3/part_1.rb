# frozen_string_literal: true

def data
  file = File.open('aoc2021/day3/input.txt')
  file.readlines.map(&:strip).map { |number| number.chars.map(&:to_i) }.transpose
end

def gamma_rate
  binary_bits = data.map { |bits| bits.count(0) > bits.count(1) ? 0 : 1 }
  binary_bits.join.to_i(2)
end

def epsilon_rate
  binary_bits = data.map { |bits| bits.count(0) < bits.count(1) ? 0 : 1 }
  binary_bits.join.to_i(2)
end

puts gamma_rate * epsilon_rate
