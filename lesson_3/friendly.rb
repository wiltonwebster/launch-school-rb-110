def generate_addend_lists(num)
  curr_num = 2
  addend_list = [[2], [1,1]]
  
  until curr_num >= num
    curr_num += 1
    new_list = []
    addend_list.each do |list|
      list.each_index do |idx|
        new_set = list.first(idx) + [list[idx] + 1] + list.last(list.size - idx - 1)
        new_list << new_set.sort.reverse
        new_list << [].fill(1, 0, curr_num)
      end
    end
    addend_list = new_list.uniq.sort.reverse
    puts "(#{curr_num},#{addend_list.size})"
  end
  addend_list
end

generate_addend_lists(50)