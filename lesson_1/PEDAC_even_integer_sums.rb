def up_to_nth_row_sum(n)
  sum = 0
  curr_num = 0
  
  (1..n).each do |row|
    (1..row).each do 
      curr_num += 1
      sum += curr_num
    end
  end
  sum
end

def nth_row_sum(n)
  up_to_nth_row_sum(n) - up_to_nth_row_sum(n-1)
end

def even_nth_row_sum(n)
  nth_row_sum(n) * 2
end

p (even_nth_row_sum(7))