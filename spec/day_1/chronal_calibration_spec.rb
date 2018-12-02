require_relative '../../lib/day_1/chronal_calibration'

describe ChronalCalibration do
  let(:input_file) {}
  subject { described_class.new input_file }
  let(:result) { subject.call }

  context 'When the input is +1, +1, +1' do
    let(:input_file) { 'spec/support/day_1/input_01' }
    it 'the result should be 3' do
      expect(result).to be == 3
    end
  end

  context 'When the input is +1, +1, -2' do
    let(:input_file) { 'spec/support/day_1/input_02' }
    it 'the result should be 0' do
      expect(result).to be == 0
    end
  end

  context 'When the input is -1, -2, -3' do
    let(:input_file) { 'spec/support/day_1/input_03' }
    it 'the result should be -6' do
      expect(result).to be == -6
    end
  end
end
