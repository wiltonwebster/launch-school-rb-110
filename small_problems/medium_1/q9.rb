# Fibonacci Numbers (Procedural)

# In the previous exercise, we developed a recursive solution to calculating the 
# nth Fibonacci number. In a language that is not optimized for recursion, some 
# (not all) recursive methods can be extremely slow and require massive 
# quantities of memory and/or stack space.

# Ruby does a reasonably good job of handling recursion, but it isn't designed 
# for heavy recursion; as a result, the Fibonacci solution is only useful up to 
# about fibonacci(40). With higher values of nth, the recursive solution is 
# impractical. (Our tail recursive solution did much better, but even that 
# failed at around fibonacci(8200).)

# Fortunately, every recursive method can be rewritten as a non-recursive 
# (procedural) method.

# Rewrite your recursive fibonacci method so that it computes its results 
# without recursion.

def fibonacci(n)
  return 0 if n < 1
  return 1 if n == 1 || n == 2
  first_num = 1
  second_num = 1
  sum = 0
  counter = 2
  until counter >= n
    sum = first_num + second_num
    first_num, second_num = second_num, sum
    counter += 1
  end
  sum
end

p fibonacci(100001)