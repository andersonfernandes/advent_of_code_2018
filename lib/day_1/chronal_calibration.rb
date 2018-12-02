# frozen_string_literal: true

class ChronalCalibration
  attr_reader :input_filename, :frequencies

  def initialize(input_filename)
    @input_filename = input_filename
    @frequencies = [0]
  end

  def call
    return unless input_filename

    current_frequency = 0
    frequency_not_found = true
    while frequency_not_found
      File.open(input_filename, 'r') do |file|
        while (line = file.gets) && frequency_not_found
          current_frequency += line.to_i
          frequency_not_found = false if frequency_exists?(current_frequency)

          process_frequency(current_frequency)
        end
      end
    end

    current_frequency
  end

  private

  def frequency_exists?(frequency)
    return if frequencies[frequency].nil?

    return true if frequency.zero?
    return frequencies[frequency.abs]&.fetch(:-, false) if frequency.negative?
    return frequencies[frequency.abs]&.fetch(:+, false) if frequency.positive?
  end

  def process_frequency(frequency)
    return if frequency.zero?

    frequencies[frequency.abs] ||= {}

    frequencies[frequency.abs][:-] = true if frequency.negative?
    frequencies[frequency.abs][:+] = true if frequency.positive?
  end
end
