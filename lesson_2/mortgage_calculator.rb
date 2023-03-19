require 'yaml'
MESSAGES = YAML.load_file('mortgage_calculator_messages.yml')

def prompt(message)
  puts("=> #{message}")
end

def valid_number?(num)
  /^-?\d+$/.match(num)
end

def number?(num)
  valid_number?(num) || float?(num)
end

def float?(num)
  /\d/.match(num) && /^-?\d*\.?\d*$/.match(num)
end

prompt(MESSAGES['welcome'])

name = ''
loop do
  name = gets.chomp

  if name.empty?
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt("Hello #{name}")

loop do
  loan_amount = ''
  loop do
    prompt(MESSAGES['loan_amt'])
    loan_amount = gets.chomp
    if valid_number?(loan_amount)
      break
    else
      prompt(MESSAGES['try_valid_number'])
    end
  end

  apr = ''
  loop do
    prompt(MESSAGES['apr'])
    apr = gets.chomp
    if valid_number?(apr)
      break
    else
      prompt(MESSAGES['try_valid_number'])
    end
  end

  loan_duration_years = ''
  loop do
    prompt(MESSAGES['loan_years'])
    loan_duration_years = gets.chomp
    if valid_number?(loan_duration_years)
      break
    else
      prompt(MESSAGES['try_valid_number'])
    end
  end

  
  
  prompt(MESSAGES['try_again'])
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end


# prompt("Thank you for using calculator. Good bye!")
prompt(MESSAGES['thank_you'])

# puts month_cal(loan_amount)

# monthly payment = loan_amount * (j / (1 - (1 + j)**(-loan_duration_months)))
# m = monthly payment
# p = loan amount
# j = monthly interest rate
# n = loan duration in months