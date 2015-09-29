Then(/^(?:the )?(output|stderr|stdout) should match the template at: "([^"]*)"$/) do |channel, template|
  expected = File.open(template, 'r') { |f| f.read }.chomp

  if Aruba::VERSION < '1.0'
    combined_output = all_commands.map do |c|
      c.stop(announcer)
      c.send(channel.to_sym).chomp
    end.join("\n")
    expect(combined_output).to eq(expected)
  else
    expect(all_commands).to eq(expected)
  end
end
