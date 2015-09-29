require_relative '../lib/prime_number'

describe 'PrimeNumber' do

  let(:prime) { PrimeNumber.new }

  describe '#first' do

    it 'should return the first x prime numbers' do
      expect(prime.first(5)).to eq([2,3,5,7,11])
    end

  end

  describe '#[]' do

    it 'should return the nth prime number' do
      expect(prime[9]).to eq(29)
    end

  end

end
