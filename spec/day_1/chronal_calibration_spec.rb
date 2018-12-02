# frozen_string_literal: true

require_relative '../../lib/day_1/chronal_calibration'

describe ChronalCalibration do
  let(:input_file) {}
  subject { described_class.new input_file }
  let(:result) { subject.call }

  context 'When the input is +1, -1' do
    let(:input_file) { 'spec/support/day_1/input_01' }
    it 'the result should be 0' do
      expect(result).to be == 0
    end
  end

  context 'When the input is +3, +3, +4, -2, -4' do
    let(:input_file) { 'spec/support/day_1/input_02' }
    it 'the result should be 10' do
      expect(result).to be == 10
    end
  end

  context 'When the input is -6, +3, +8, +5, -6' do
    let(:input_file) { 'spec/support/day_1/input_03' }
    it 'the result should be 5' do
      expect(result).to be == 5
    end
  end

  context 'When the input is +7, +7, -2, -7, -4' do
    let(:input_file) { 'spec/support/day_1/input_04' }
    it 'the result should be 14' do
      expect(result).to be == 14
    end
  end
end
