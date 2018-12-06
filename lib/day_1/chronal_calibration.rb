# frozen_string_literal: true

class ChronalCalibration
  attr_reader :input_filename, :frequencies

  def initialize(input_filename)
    @input_filename = input_filename
    @frequencies = {}
  end

  def call
    return unless input_filename
    input = File.readlines(input_filename).map(&:to_i)

    current_frequency = 0
    input.cycle.each do |value|
      current_frequency += value
      break if frequency_exists?(current_frequency)

      process_frequency(current_frequency)
    end

    current_frequency
  end

  private

  def frequency_exists?(frequency)
    return if frequencies[frequency].nil?
    return true if frequency.zero?

    frequencies[frequency]
  end

  def process_frequency(frequency)
    return if frequency.zero?

    frequencies[frequency] = true
  end
end
