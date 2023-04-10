# Hash of valid choices and win values
VALID_CHOICES = {
  'rock': %w[scissors lizard],
  'paper': %w[rock spock],
  'scissors': %w[paper lizard],
  'spock': %w[scissors rock],
  'lizard': %w[spock paper]
}

# Hash of abbreviated valid choices
VALID_CHOICES_ABBREVIATED = {
  'r': 'rock',
  'p': 'paper',
  'sc': 'scissors',
  'sp': 'spock',
  'l': 'lizard'
}

# Prefaces each message in the console with a hash rocket
def prompt(message)
  puts "=> #{message}"
end

# Converts the abbreviated entries to full entry values
def convert_abbreviated(choice)
  VALID_CHOICES_ABBREVIATED.values_at(choice).join
end

# Checks if 's' is entered instad of 'sc' or 'sp'
def invlid_entry_for_s
  prompt("Remember 's' is not a valid selection, please enter 'sc' for scissors 
    or 'sp' for spock")
  input_choice
end

# Checks for valid entry
def invalid_entry
  prompt("Please enter a valid entry!")
  input_choice
end

# Gets user choice
def input_choice
  prompt("Please enter 'r' for rock, 'p' for paper, 'sc' for scissors, 
    'sc' for spock, and 'l' for lizard")
  choice = gets.chomp.downcase
  validate(choice)
end

# Validates user input
def validate(choice)
  loop do
    choice = invalid_entry_for_s if choice == 's'
    break if VALID_CHOICES.key?(choice)
    break (choice = convert_abbreviated(choice)) 
    if VALID_CHOICES_ABBREVIATED.key?(choice)

    choice = invalid_entry
  end
  choice
end

# Define win using Hash key/value pairs
def win?(first, second)
  VALID_CHOICES[first].include?(second)
end

# Checks for winner
def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

# Increments wins
def increment_wins(player, computer, wins)
  if win?(player, computer)
    wins[:player_wins] += 1
  elsif win?(computer, player)
    wins[:computer_wins] += 1
  end
end

# Displays the winner if wins equals 3
def display_winner(wins)
  winner = wins[:player_wins] == 3 ? 'Player' : 'Computer'
  prompt("#{winner} wins!")
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
