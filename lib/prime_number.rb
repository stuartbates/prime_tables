class PrimeNumber

  include Enumerable

  def initialize
    @primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101]
    @last_prime_index = -1
  end

  def each
    return self.dup unless block_given?
    loop { yield self.next }
  end

  def next
    @last_prime_index += 1
    self[@last_prime_index]
  end

  def [](index)
    @primes[index]
  end

end
