num = rand(1..10)

puts "Pick a number between 1 and 10"
guess = gets

puts "Too high" if guess.to_i > num
puts "Too low" if guess.to_i < num
puts "Nice guess" if guess.to_i == num
