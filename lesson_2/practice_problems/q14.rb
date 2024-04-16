# Given this data structure write some code to return an array containing the 
# colors of the fruits, and the sizes of the vegetables. The sizes should be
# uppercase and the colors should be capitalized.

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

result = hsh.values.map do |details|
  if details[:type] == "fruit"
    details[:colors].map(&:capitalize)
  elsif details[:type] == "vegetable"
    details[:size].upcase
  end
end

p result == [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]