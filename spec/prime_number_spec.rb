require_relative '../lib/prime_number'

describe 'PrimeNumber' do

  let(:prime) { PrimeNumber.new }

  describe '#first' do

    it 'should return the first x prime numbers' do
      expect(prime.first(5)).to eq([2,3,5,7,11])
    end

  end

  describe '#[]' do

    context 'asking for 10th prime number' do
      it 'should return 29' do
        expect(prime[9]).to eq(29)
      end
    end

    context 'asking for 500th prime number' do
      it 'should return 3571' do
        expect(prime[499]).to eq(3571)
      end
    end

  end

  describe '#generate_batch' do

    it 'generates an array of sequential integers to sieve through' do
      batch = prime.send(:generate_batch, [2,3,5], 100)
      expect(batch.first).to eq(7)
      expect(batch.last).to eq(107)
    end

  end

  describe '#calculate_break_point' do

    it 'returns the square root of the batch maximum' do
      expect(prime.calculate_break_point(120)).to eq(10)
      expect(prime.calculate_break_point(122)).to eq(11)
    end

  end

  describe '#calculate_index_of_composite' do
    context 'for batch starting at 103' do
      it 'returns the index of the next multiple of 2' do
        expect(prime.send(:calculate_index_of_composite, 2, 103)).to eq(1)
      end
    end
  end

end
