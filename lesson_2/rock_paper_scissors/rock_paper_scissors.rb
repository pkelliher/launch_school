VALID_CHOICES = {
  'rock': %w[scissors lizard],
  'paper': %w[rock spock],
  'scissors': %w[paper lizard],
  'spock': %w[scissors rock],
  'lizard': %w[spock paper]
}

VALID_CHOICES_ABBREVIATED = {
  'r': 'rock',
  'p': 'paper',
  'sc': 'scissors',
  'sp': 'spock',
  'l': 'lizard'
}

def prompt(message)
  puts "=> #{message}"
end

def invlid_entry_for_s
  prompt("Please enter 'sc' for scissors or 'sp' for spock")
  input_choice
end

def invalid_entry
  prompt("Please enter a valid entry!")
  input_choice
end

def input_choice
  prompt("Please enter 'r' for rock, 'p' for paper, 'sc' for scissors, 
    'sc' for spock, and 'l' for lizard")
    choice = gets.chomp.downcase
end

def convert_abbreviated(choice)
  VALID_CHOICES_ABBREVIATED.values_at(choice).join
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'rock' && second == 'lizard') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'paper' && second == 'spock') ||
    (first == 'scissors' && second == 'paper') ||
    (first == 'scissors' && second == 'lizard') ||
    (first == 'spock' && second == 'scissors') ||
    (first == 'spock' && second == 'rock') ||
    (first == 'lizard' && second == 'spock') ||
    (first == 'lizard' && second == 'paper')
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{choice}; Computer chose: #{computer_choice}.")

  display_results(choice, computer_choice)
  # score()

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for playing. Good bye!")
