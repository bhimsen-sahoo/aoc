# frozen_string_literal: true

class CalorieCounter
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def calorie_sums
    data
      .strip
      .split("\n\n")
      .map { |payload_per_elf| payload_per_elf.strip.split("\n").map(&:to_i).sum }
  end

  def heighest_calories
    calorie_sums.max
  end

  def top_n_totals(n)
    calorie_sums.sort.last(n).sum
  end
end

counter = CalorieCounter.new(File.open('data.txt').read)
puts counter.heighest_calories
puts counter.top_n_totals(3)
