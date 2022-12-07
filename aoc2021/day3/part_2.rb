# frozen_string_literal: true

# def data
#   file = File.open('input.txt')
#   file.readlines.map(&:strip).map { |number| number.chars.map(&:to_i) }
# end

# filtered_list = data.dup
# pp filtered_list
# size = data[0].length

# size.times do |i|
#   break if filtered_list.size == 1

#   data[i]
#   puts "vertical bits: #{vertical_bits}"
# end
# puts data.map{|p| p[0]}
# puts size

# def oxygen_generator_rating
# end

# def co2_scrubber_rating
# end

# puts oxygen_generator_rating * co2_scrubber_rating

require 'matrix'

class BinaryDiagnostic
  def data
    file = File.open('input.txt')
    file.readlines.map(&:strip).map(&:chars).map { |i| i.map(&:to_i) }
  end

  def part2
    filter_oxygen(data).join.to_i(2) * filter_carbon(data).join.to_i(2)
  end

  def filter_oxygen(numbers, column_index = 0)
    mode_bit       = oxy_mode_bit_calc(Matrix[*numbers].column(column_index).to_a.tally.invert)
    filtered_layer = numbers.select { |number| number[column_index] == mode_bit }
    return filtered_layer[0] if filtered_layer.length < 2

    filter_oxygen(filtered_layer, column_index + 1)
  end

  def filter_carbon(numbers, column_index = 0)
    mode_bit = carbox_mode_bit_calc(Matrix[*numbers].column(column_index).to_a.tally.invert)
    filtered_layer = numbers.select { |number| number[column_index] == mode_bit }
    return filtered_layer[0] if filtered_layer.length < 2

    filter_carbon(filtered_layer, column_index + 1)
  end

  def carbox_mode_bit_calc(freq_dist)
    return 0 unless freq_dist.keys.uniq.length > 1

    freq_dist[freq_dist.keys.min]
  end

  def oxy_mode_bit_calc(freq_dist)
    return 1 unless freq_dist.keys.uniq.length > 1

    freq_dist[freq_dist.keys.max]
  end
end

solver = BinaryDiagnostic.new
p solver.part2
