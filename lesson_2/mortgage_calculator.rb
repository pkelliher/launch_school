require 'yaml'
MESSAGES = YAML.load_file('mortgage_calculator_messages.yml')

def prompt(message)
  puts("=> #{message}")
end

prompt(MESSAGES['welcome'])

name = ''
loop do
  name = gets.chomp

  if name.empty?
    # prompt("Make sure to use a valid name.")
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt("Hi #{name}")

prompt(MESSAGES['loan_amt'])
loan_amount = gets.chomp.to_i

prompt(MESSAGES['apr'])
apr = gets.chomp.to_i

prompt(MESSAGES['loan_years'])
loan_duration_years = gets.chomp.to_i

# puts month_cal(loan_amount)

# monthly payment = loan_amount * (j / (1 - (1 + j)**(-loan_duration_months)))
# m = monthly payment
# p = loan amount
# j = monthly interest rate
# n = loan duration in months