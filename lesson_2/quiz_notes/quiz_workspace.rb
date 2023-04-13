# def longest_word(sentence)
#   words = sentence.split
#   saved_word = words[0]

#   words.each do |word|
#     if word.length > saved_word.length
#       saved_word = word
#     end
#   end

#   saved_word
# end

# def longest_word(sentence)
#   words = sentence.split
#   saved_word = words.shift

#   words.each do |word|
#     if saved_word.length < word.length
#       saved_word = word
#     end
#   end

# def longest_word(sentence)
#   words = sentence.split
#   saved_word = words.shift

#   words.each do |word|
#     if word.length >= saved_word.length
#       saved_word = word
#     end
#   end

#   saved_word
# end

# def longest_word(sentence)
#   words = sentence.split
#   saved_word = words[0]

#   words.each do |word|
#     if word.length >= saved_word.length
#       saved_word = word
#     end
#   end

#   saved_word
# end

# puts longest_word("This is the day that will change your life")


def extend_greeting(greeting)
  greeting += " there"
end

greeting = "hi"
extend_greeting(greeting)

puts greeting