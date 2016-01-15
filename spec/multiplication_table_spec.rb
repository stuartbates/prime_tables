require 'multiplication_table'

describe 'MultiplicationTable' do

  let(:numbers) { [1,2,3] }
  let(:formatter) { double('formatter') }
  let(:table) { MultiplicationTable.new(numbers, formatter) }

  describe '#output' do
    it 'should call output on the formatter and pass in self as context' do
      expect(formatter).to receive(:output).with(table)
      table.output
    end
  end

  describe '#generate_table_data' do

    it 'generates a multi-dimensional array of the number products' do
      products = table.generate_table_data(numbers)
      expect(products).to eq([[1, 2, 3], [2, 4, 6], [3, 6, 9]])
    end

  end

end
