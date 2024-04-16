# Delete vowels

# Write a method that takes an array of strings, and returns an array of the 
# same string values, except with the vowels (a, e, i, o, u) removed.

def remove_vowels(array_of_strings)
  array_of_strings.map { |word| word.delete('AEIOUaeoiu') }
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']