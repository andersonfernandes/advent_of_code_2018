class InventoryManagement
  attr_reader :input_filename, :frequencies

  def initialize(input_filename)
    @input_filename = input_filename
    reset_frequencies
  end

  def call
    return unless input_filename

    two_times = 0
    three_times = 0
    File.open(input_filename, 'r') do |file|
      while line = file.gets
        line.delete!("\n")
        line.downcase.each_byte do |byte|
          frequencies[byte] += 1
        end

        two_times += 1 unless frequencies.select { |n| n == 2 }.empty?
        three_times += 1 unless frequencies.select { |n| n == 3 }.empty?

        reset_frequencies
      end
    end

    two_times * three_times
  end

  private 

  def reset_frequencies
    @frequencies = Array.new(256) { |_| 0 }
  end
end
