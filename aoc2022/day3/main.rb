class RucksackOrganizer
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def part1
    data
      .map(&:strip)
      .map { |line| common_char(line) }
      .map { |char| assigned_digit(char) }
      .sum
  end

  def part2
    data
      .map(&:strip)
      .each_slice(3)
      .map { |group| group.map(&:chars).reduce(&:&) }
      .flatten
      .map { |char| assigned_digit(char) }
      .sum
  end

  def common_char(line)
    c1, c2 = line.chars.each_slice(line.length / 2).map(&:join)
    (c1.chars & c2.chars)[0]
  end

  def assigned_digit(char)
    ('a'..'z').to_a.concat(('A'..'Z').to_a).index(char) + 1
  end
end

solver = RucksackOrganizer.new(File.open('aoc2022/day3/data.txt').readlines)
p solver.part1
p solver.part2
