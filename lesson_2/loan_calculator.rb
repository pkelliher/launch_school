loan_duration_months = def month_cal(loan_duration_years)
  loan_duration_years / 12  
end

puts "Welcome to the mortgage calculator, please enter your name to get started:"
name = gets.chomp

puts "Hi, #{name} please enter the amount of your home loan:"
loan_amount = gets.chomp.to_i

puts "#{name} please enter the Annual Percentage Rate (APR) of your loan:"
apr = gets.chomp.to_i

puts "#{name} please enter the duration of your loan in years:"
loan_duration_years = gets.chomp.to_i

puts loan_duration_months

# monthly payment = loan_amount * (j / (1 - (1 + j)**(-loan_duration_months)))
# m = monthly payment
# p = loan amount
# j = monthly interest rate
# n = loan duration in months