class CampCleanup
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def part1
    data
      .map { |line| line.strip.split(',') }
      .count { |pair| total_overlap?(pair) }
  end

  def part2
    data
      .map { |line| line.strip.split(',') }
      .count { |pair| partial_overlap?(pair) }
  end

  def total_overlap?(pair)
    r1, r2 = get_ranges_from_pair(pair)
    (r1 - r2).empty? || (r2 - r1).empty?
  end

  def partial_overlap?(pair)
    r1, r2 = get_ranges_from_pair(pair)
    ((r1 - r2).length != r1.length) && ((r2 - r1).length != r2.length)
  end

  def get_ranges_from_pair(pair)
    part1, part2 = pair
    r1 = Range.new(*part1.split('-').map(&:to_i)).to_a
    r2 = Range.new(*part2.split('-').map(&:to_i)).to_a
    [r1, r2]
  end
end

solver = CampCleanup.new(File.open('aoc2022/day4/data.txt').readlines)
p solver.part1
p solver.part2
