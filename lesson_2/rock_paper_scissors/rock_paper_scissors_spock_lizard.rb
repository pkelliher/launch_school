require 'yaml'
MESSAGES = YAML.load_file('rock_paper_scissors_spock_lizard_messages.yml')

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
  puts("=> #{message}")
end

# Converts the abbreviated entries to full entry values
def convert_abbreviated(choice)
  VALID_CHOICES_ABBREVIATED.values_at(choice).join
end

# Checks if 's' is entered instad of 'sc' or 'sp'
def invlid_entry_for_s
  prompt(MESSAGES['invalid_s'])
  input_choice
end

# Checks for valid entry
def invalid_entry
  prompt(MESSAGES['invalid_selection'])
  input_choice
end

# Gets user choice
def input_choice
  prompt(MESSAGES['selection'])
  choice = gets.chomp.downcase
  validate(choice)
end

# Validates user input
def validate(choice)
  loop do
    choice = invalid_entry_for_s if choice == 's'
    break if VALID_CHOICES.key?(choice)
    break if (choice = convert_abbreviated(choice)) 
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
    prompt(MESSAGES['u_win'])
  elsif win?(computer, player)
    prompt(MESSAGES['c_win'])
  else
    prompt(MESSAGES['tie'])
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

# Prompt to play again
def play_again?
  yes = %w[y yes]
  no = %w[n no]
  loop do
    prompt(MESSAGES['play_again'])
    answer = gets.chomp.downcase
    break true if yes.include?(answer)
    break false if no.include?(answer)
    prompt(MESSAGES['invalid_selection'])
  end
end

# Welcomes to the game
prompt("Welcome to #{VALID_CHOICES.keys.join(', ')}")

# Main game loop
loop do
  wins = {
    player_wins: 0,
    computer_wins: 0
  }

  until wins.value?(3)
    choice = input_choice
    computer_choice = VALID_CHOICES.keys.sample
    prompt("You selected: #{choice}, and computer selected: #{computer_choice}")
    display_results(choice, computer_choice)
    increment_wins(choice, computer_choice, wins)
    prompt("Player: #{wins[:player_wins]}, Computer: #{wins[:comptuer_wins]}")
  end

  display_winner(wins)
  break unless play_again?
end

prompt(MESSAGES['thank_you'])