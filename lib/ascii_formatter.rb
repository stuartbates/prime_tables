class AsciiFormatter

  def output(context)
    puts header_row(context.numbers)
    puts header_border(context.numbers.size, 4)
    context.numbers.each_with_index do |number, index|
      puts inner_row(number, context.data[index])
    end
  end

  protected

  def header_row(numbers)
    row = format_with_padding(' ', 5)
    row + numbers.collect { |number| format_with_padding(number, 4) }.join
  end

  def header_border(columns, width)
    '-'* width + '+' + '-'*(width*columns)
  end

  def inner_row(number, data)
    row = format_with_padding(number, 3)
    row += format_with_padding('|', 2)
    row + data.collect { |result| format_with_padding(result, 4) }.join
  end

  private

  def format_with_padding(value, padding=4)
    sprintf("%#{padding}s", value)
  end

end
