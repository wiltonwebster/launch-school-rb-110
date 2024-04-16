# Create a miniature stack-and-register program using pre-defined methods.

def minilang(commands)
  register = 0
  stack = []
  commands.split.each do |command|
    register = perform(command, stack, register)
  end
end

def perform(command, stack, register)
  register = 
    case command
    when "PRINT"
      print_out(register)
    when "POP"
      pop(stack)
    when "MOD"
      mod(stack, register)
    when "DIV"
      div(stack, register)
    when "MULT"
      mult(stack, register)
    when "SUB"
      subtract(stack, register)
    when "ADD"
      add(stack, register)
    when "PUSH"
      push(stack, register)
    else
      place(command)
    end
end

def print_out(register)
  puts register
  register
end

def pop(stack)
  stack.pop
end

def mod(stack, register)
  register % pop(stack)
end

def div(stack, register)
  register / pop(stack)
end

def mult(stack, register)
  register * pop(stack)
end

def subtract(stack, register)
  register - pop(stack)
end

def add(stack, register)
  register + pop(stack)
end

def push(stack, register)
  stack << register
  register
end

def place(input)
  input.to_i
end

minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')
# (nothing printed; no PRINT commands)