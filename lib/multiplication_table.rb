class MultiplicationTable

  def initialize(numbers, formatter)
    @numbers, @formatter = numbers, formatter
  end

  def output
    @data ||= generate_table_data(@numbers)
    @formatter.output(self)
  end

  def generate_table_data(numbers)
    numbers.collect do |y_number|
      numbers.collect { |x_number| y_number * x_number }
    end
  end

end
