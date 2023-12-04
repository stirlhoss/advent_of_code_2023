File.open('input.txt') do |file|
    total = 0
    file.each_line do |line|
        # strip out all non-number
        line.gsub!(/[^0-9]/, '')
        # add (first + last) to total
        total += (line[0] + line[-1]).to_i
    end
    puts "Total: #{total}"
  end
