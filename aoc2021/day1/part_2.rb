# frozen_string_literal: true

def data
  file = File.open('aoc2021/day1/input.txt')
  file.read.split.map(&:to_i)
end

def find_increase_count
  data.each_cons(3).map(&:sum).each_cons(2).select {|x, y| y > x }.count
end

puts find_increase_count
