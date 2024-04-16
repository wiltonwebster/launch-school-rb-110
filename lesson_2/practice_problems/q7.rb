# Given this code, what would be the final values of a and b? Try to work this 
# out without running the code.

a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a

# The local variable a points to the integer 2. The local variable b points to 
# an array containing integers 5 and 8. The local variable arr points to the 
# array referenced by [a, b], which evaluates to [2, [5, 8]]. On line 8, arr[0]
# is reassigned to the value of arr[0] + 2, which is 4. Since integers are
# immutable, a still points to 2, and arr no longer points to the same values as
# [a, b]. On line 9, the value of arr[1][0] is reassigned to the value of 
# arr[1][0] - a, which evaluates to 3. Since b was pointing to the same object 
# as arr[1], this reassignment mutates b as well. 

# At the end of execution, a is pointing to 2, b is pointing to [3, 8], and 
# arr is pointing to [4, [3, 8]].

p a
p b
p arr