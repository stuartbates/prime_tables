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
    generate_primes while @primes.size <= index
    @primes[index]
  end

  # Based on: https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes
  def generate_primes
    batch = generate_batch(@primes, 1e6)
    break_point = calculate_break_point(batch.last)
    batch_min = batch.first

    @primes.each do |prime|
      break if prime > break_point
      index = calculate_index_of_composite(prime, batch_min)
      while index < batch.size do
        batch[index] = nil
        index += prime
      end
    end

    @primes.concat(batch.compact!)
  end

  def generate_batch(primes, size)
    start_of_batch = primes.last + 2
    end_of_batch = start_of_batch + size
    (start_of_batch..end_of_batch).to_a
  end

  def calculate_break_point(maximum)
    Math.sqrt(maximum).floor.to_i
  end

  def calculate_index_of_composite(prime, batch_min)
    prime - (batch_min % prime)
  end

end
