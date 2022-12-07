# frozen_string_literal: true
require 'matrix'
def data
  file = File.open('input.txt')
  file.read.strip.split("\n\n")
end

numbers = data[0].split(',')
boards = data[1..-1].map { |d| d.strip.split("\n").map { |line| line.split(' ') } }

pp numbers
pp boards
# Class BingoBoard

# end
