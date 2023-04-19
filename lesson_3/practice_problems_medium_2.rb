# def tricky_method(string_param_one, string_param_two)
#   string_param_one += "rutabaga"
#   string_param_two << "rutabaga"
# end

# string_arg_one = "pumpkins"
# string_arg_two = "pumpkins"
# tricky_method(string_arg_one, string_arg_two)

# puts "String_arg_one looks like this now: #{string_arg_one}"
# puts "String_arg_two looks like this now: #{string_arg_two}"

# def tricky_method_two(a_string_param, an_array_param)
#   a_string_param << 'rutabaga'
#   an_array_param = ['pumpkins', 'rutabaga']
# end

# my_string = "pumpkins"
# my_array = ["pumpkins"]
# tricky_method_two(my_string, my_array)

# puts "My string looks like this now: #{my_string}"
# puts "My array looks like this now: #{my_array}"

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"