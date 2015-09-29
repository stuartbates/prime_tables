require_relative '../lib/ascii_formatter'

describe 'AsciiFormatter' do

  let(:formatter) { AsciiFormatter.new }
  let(:lines) { File.open('spec/support/golden_master.txt', 'r') { |f| f.readlines }.map(&:chomp) }

  describe '#header_row' do
    it 'returns header row matching line 1 of golden master' do
      expected = lines[0]
      expect(formatter.send(:header_row, [2,3,5,7,11,13,17,19,23,29])).to eq(expected)
    end
  end

  describe '#header_border' do
    it 'returns header row matching line 2 of golden master' do
      expected = lines[1]
      expect(formatter.send(:header_border, 10, 4)).to eq(expected)
    end
  end

  describe '#inner_row' do
    it 'returns inner row matching line 3 of golden master' do
      expected = lines[2]
      expect(formatter.send(:inner_row, 2, [4,6,10,14,22,26,34,38,46,58])).to eq(expected)
    end
  end

end
