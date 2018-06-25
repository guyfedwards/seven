term = ARGV[0]
file = ARGV[1]

File.open(file) do |file|
  file.each_with_index do |line,ind|
    if /#{term}/.match(line) != nil
      puts "Found on line #{ind + 1}"
      puts line
    end
  end
end

