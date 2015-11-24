# Prime Tables

##Objective

Write a program that prints a multiplication table of primes numbers.

The program should take an argument from the command line that specifies the amount of prime numbers to generate and print out a multiplication table for these prime numbers.

An example of the way the application may run:

  `<executable_script_name> --count 10`

## Commentary:

- There's a custom step definition which may appear unnecessary at first glance given the step definitions that come bundled with Aruba.  But as the output contains pipes and Aruba is internally using String#match - it means we can use eq() and not get lost in a sea of escaping!
- I've used a strategy pattern to separate the logic of the table generation and it's display.  As a result:
  - You could easily inject a HTML or PDF formatter instead of the ASCII formatter
  - It doesn't rely on prime numbers - you could just as easily swap these out for sequential, odd or composite numbers etc...
- If I'd been able to find a gem to handle the table outputting out-the-box I'd probably have done away with the explicit formatter class and simply passed in the strategy as a block.
- I've generated prime numbers using the Eratosthenes Sieve algorithm - it's a fairly basic implementation based off the Wikipedia article which could be improved - e.g:
  - Abstracting out the generation strategy itself to allow for other strategies
  - Delegating off the class down to the enumerable methods on the instance (as the Ruby library version does) which would provide a much nicer interface.  
  - However given there's already a perfectly good Prime class in Ruby I felt this might be over-engineering for this case.
- After some quick UAT I've realised it could be improved by setting the column width of the table dynamically as larger numbers/products will start to overlap.  I haven't implemented it here but would be pretty straightforward with something like: (highest_number * highest_number).to_s.length
