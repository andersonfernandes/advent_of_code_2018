class ChronalCalibration
  attr_reader :input_filename

  def initialize(input_filename)
    @input_filename = input_filename
  end

  def call
    return unless input_filename

    current_value = 0
    File.open(input_filename, 'r') do |file|
      while line = file.gets
        current_value += line.to_i
      end
    end

    current_value
  end
end
