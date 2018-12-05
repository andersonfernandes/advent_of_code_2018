# frozen_string_literal: true

class ChronalCalibration
  attr_reader :input_filename, :frequencies

  def initialize(input_filename)
    @input_filename = input_filename
    @frequencies = {}
  end

  def call
    return unless input_filename

    current_frequency = 0
    frequency_not_found = true
    while frequency_not_found
      File.open(input_filename, 'r').each_line do |line|
        current_frequency += line.to_i
        if frequency_exists?(current_frequency)
          frequency_not_found = false
          break
        end

        process_frequency(current_frequency)
      end
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
