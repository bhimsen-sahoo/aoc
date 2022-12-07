# frozen_string_literal: true

class RockPaperScissor
  attr_reader :data

  SHAPE_RANK = { rock: 1, paper: 2, scissor: 3 }.freeze
  WIN_RULE = { rock: :paper, paper: :scissor, scissor: :rock }.freeze

  def initialize(data)
    @data = data
  end

  def derived_shape(encrypted_shape)
    case encrypted_shape
    when 'A', 'X'
      :rock
    when 'B', 'Y'
      :paper
    when 'C', 'Z'
      :scissor
    end
  end

  def part1
    data.reduce(0) do |acc, move|
      p1, p2 = move.strip.split
      if WIN_RULE[derived_shape(p1)].eql?(derived_shape(p2))
        acc += 6
      elsif derived_shape(p1).eql?(derived_shape(p2))
        acc += 3
      end
      acc += SHAPE_RANK[derived_shape(p2)]
      acc
    end
  end

  def part2
    data.reduce(0) do |acc, move|
      p1, p2 = move.strip.split
      p2_shape =
      case p2
      when 'X'
        WIN_RULE.invert[derived_shape(p1)]
      when 'Y'
        acc += 3
        derived_shape(p1)
      when 'Z'
        acc += 6
        WIN_RULE[derived_shape(p1)]
      end
      acc += SHAPE_RANK[p2_shape]
      acc
    end
  end
end

play = RockPaperScissor.new(File.open('data.txt').readlines)
puts play.part1
puts play.part2
