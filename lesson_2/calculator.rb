# ask the user for two numbers
# ask the user for an operation to perform
# peform the operation on the two numbers
# output the result
require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

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

def operation_to_message(op)
  word =  case op
          when '1'
            'Adding'
          when '2'
            'Subtracting'
          when '3'
            'Multiplying'
          when '4'
            'Dividing'
          end

  word
end

# prompt("Welcome to Calculator! Enter your name:")
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
# prompt(MESSAGES['name'])

loop do #main loop
number1 = ''
loop do
  # prompt("What's the first number?")
  prompt(MESSAGES['first_number'])
  number1 = gets.chomp
  if valid_number?(number1)
    break
  else
    # prompt("Hm. that doesn't look like a value number")
    prompt(MESSAGES['try_valid_number'])
  end
end

number2 = ''
loop do
  # prompt("What's the second number?")
  prompt(MESSAGES['second_number'])
  number2 = gets.chomp

  if valid_number?(number2)
    break
  else
    # prompt("Hm. that doesn't look like a value number")
    prompt(MESSAGES['try_valid_number'])
  end
end

# operator_prompt = <<-MSG
#   What operation would you like to perform?
#   1) add
#   2) subtract
#   3) multiply
#   4) divide
# MSG
# prompt(operator_prompt)

prompt(MESSAGES['operator_prompt'])

operator = ''
loop do
  operator = gets.chomp

  if %w(1 2 3 4).include?(operator)
    break
  else
    # prompt("Must choose, 1, 2, 3 or 4")
    prompt(MESSAGES['must_choose'])
  end
end

prompt("#{operation_to_message(operator)} the two numbers...")

result =  case operator
          when '1'
            number1.to_i + number2.to_i
          when '2'
            number1.to_i - number2.to_i
          when '3'
            number1.to_i * number2.to_i
          when '4'
            number1.to_f / number2.to_f
          end

prompt("The result is #{result}")

# prompt("Do you want to perform another calculation? (Y to calculate again)")
prompt(MESSAGES['try_again'])
answer = gets.chomp
break unless answer.downcase.start_with?('y')
end

# prompt("Thank you for using calculator. Good bye!")
prompt(MESSAGES['thank_you'])
