# Write a one-line program that creates the following output 10 times, with the subsequent line indented 1 space to the right:
# 10.times { |number| puts (" " * number) + "The Flintstones Rock!" }

# def factors(number)
#   divisor = number
#   factors = []
#   begin
#     factors << number / divisor if number % divisor == 0
#     divisor -= 1
#   end until divisor == 0
#   factors
# end

def factors(number)
  divisor = number
  factors = []
  while divisor > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

puts factors(25)