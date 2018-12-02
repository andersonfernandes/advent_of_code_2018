require_relative '../../lib/day_2/inventory_management'

describe InventoryManagement, type: :day_2 do
  let(:input_file) {}
  subject { described_class.new input_file }
  let(:result) { subject.call }

  context 'when given file input_01 as input' do
    let(:input_file) { 'spec/support/day_2/input_01' }
    it 'the result should be 12' do
      expect(result).to be == 12
    end
  end
end
