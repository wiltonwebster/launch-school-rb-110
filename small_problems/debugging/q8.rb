# Password

# The following code prompts the user to set their own password if they haven't
# done so already, and then prompts them to login with that password. However, 
# the program throws an error. What is the problem and how can you fix it?

# Once you get the program to run without error, does it behave as expected? 
# Verify that you are able to log in with your new password.

password = nil

def set_password
  puts 'What would you like your password to be?'
  new_password = gets.chomp
  password = new_password
end

def verify_password
  puts '** Login **'
  print 'Password: '
  input = gets.chomp

  if input == password
    puts 'Welcome to the inside!'
  else
    puts 'Authentication failed.'
  end
end

if !password
  set_password
end

verify_password

# The set_password method is returning the object refereced by new_password, but
# we never reassign password anywhere. The local varaible password created in 
# the method is not the same variable as the password created outside the method
# since those exist in different scopes. We should take the return value of 
# set_password and assign it to password on line 31. We also need to pass the
# value referenced by password into our verify_password method so it's in scope
# to run the comparison.