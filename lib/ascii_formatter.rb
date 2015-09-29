class AsciiFormatter

  def output(context)
    puts header_row(context.numbers)
    puts header_border(context.numbers.size, 4)
    context.numbers.each_with_index do |number, index|
      puts inner_row(number, context.data[index])
    end
  end

  def header_row(numbers)
    row = sprintf("%5s", ' ')
    row + numbers.collect { |number| sprintf("%4s", number) }.join
  end

  def header_border(columns, width)
    '-'* width + '+' + '-'*(width*columns)
  end

  def inner_row(number, data)
    row = sprintf("%3s", number)
    row += sprintf("%2s", '|')
    row + data.collect { |result| sprintf("%4s", result) }.join
  end

end
