Feature: Generate Multiplication Table

  Scenario: Generate multiplication table using the first 10 primes
    Given a mocked home directory
    When I run `prime_tables --count 10`
    Then the stdout should match the template at: "spec/support/golden_master.txt"
