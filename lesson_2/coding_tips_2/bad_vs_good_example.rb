# bad

# name = ''
# puts "Enter your name: "
# loop do
#   name = gets.chomp
#   break unless name.empty?
#   puts "That's an invalid name. Try again:"
# end
# puts "Welcome #{name}!"
# puts "What would you like to do?"

# better

# name = ''

# puts "Enter your name: "
# loop do
#   name = gets.chomp
#   break unless name.empty?
#   puts "That's an invalid name. Try again:"
# end

# puts "Welcome #{name}!"
# puts "What would you like to do?"

name = 'johnson'

['kim', 'joe', 'sam'].each do |fname|
  name = fname
end


