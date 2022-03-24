=begin

Create a method to perform a bubble sort on an array.
The method should accept a block (or not). If a block is given,
then the block will dictate the sort order by performing a comparison evaluation
between the 2 elements passed to it 

input: array
output: array (mutated from given)

- must accept an optional block
- by default if not block given, array will be sorted in ascending order
- a bubble sort only stops iterating once a traversal over the elements has completed
without any swapping of element positions taking place


Examples: 
array = [5, 3]
bubble_sort!(array)
array == [3, 5]

array = [5, 3, 7]
bubble_sort!(array) { |first, second| first >= second }
array == [7, 5, 3]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
array == [1, 2, 4, 6, 7]

array = [6, 12, 27, 22, 14]
bubble_sort!(array) { |first, second| (first % 7) <= (second % 7) }
array == [14, 22, 12, 6, 27]

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array)
array == %w(Kim Pete Tyler alice bonnie rachel sue)

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |first, second| first.downcase <= second.downcase }
array == %w(alice bonnie Kim Pete rachel sue Tyler)

Data Structure: 
array => sort array based on criteria in block (or defaults to ascending) =>
modified version of original array

Brainstorming:
- need to have a toggle variable to be able to tell when a element swap has ocurred
on an traversal over the collection
  - function should stop iterating over collection once it completes a pass over it
  without this variable  being toggled to `true`
- if a block given, yield 2 elements at a time to the block
  - the return value of the block should dictate the order of these 2 elements, and
  whether or not they need to swap positions
- By default, the sort order should sort in ascending order, which means that
the element on the left is <= the element on the right in a comparison of 2 adjacent 
elements
- The block will be comparing 2 elements
  - if the block returns `true` then the sort order stays as is, skip to next iteration
    - if false, then elements need to be swapped
      - use a,b = b,a idiom for this
  - No block:
    - check to see if a <= b and skip to next iteration if so
  - If code makes it to here in inner loop, then it means elements need to swap places 
  so do that
    - also toggle swap variable if this reaches here
- Outer loop that is used to tell when the toggle variable has been changed, and
inner traversal over given collection
- the toggle variale gets reassigned to `false` on each iteration of the outer loop
- Iterate over a range of numbers from 1 through the size of array -1
  - THis will allow the program to keep track of what element is at what index
  - Will be working with the current index value as second element (b) and (current index - 1)
  as the first element, (a)
Algorithm: given `array`
- start a loop:
  - init `swapped` to `false`
  - Traverse range of numbers from 1 through size of array, exclusive, `index`
    - assign `previous_index` to index - 1
    - if a block is given
      - yield array[previous_index] and array[index] to implicit block
      - if block returns true, skip to next iteration
    - else no block given
      - 


=end

# def bubble_sort!(array)
#   swap_elements = proc { |a, b| array[a], array[b] = array[b], array[a] }

#   loop do
#     swap_occurred = false

#     (1...array.size).each do |index|
#       previous_index = index - 1
#       first = array[previous_index]
#       second = array[index]
      
#       no_swap = block_given? ? yield(first, second) : (first <= second)
#       next if no_swap
      
#       swap_elements.call(previous_index, index) 
#       swap_occurred = true
#     end

#     break unless swap_occurred
#   end
#   nil
# end


# array = [5, 3]
# bubble_sort!(array)
# p array #== [3, 5]

# array = [7, 5, 3]
# bubble_sort!(array) { |first, second| first >= second }
# p array #== [7, 5, 3]

# array = [6, 2, 7, 1, 4]
# bubble_sort!(array)
# p array #== [1, 2, 4, 6, 7]

# array = [6, 12, 27, 22, 14]
# bubble_sort!(array) { |first, second| (first % 7) <= (second % 7) }
# p array == [14, 22, 12, 6, 27]

# array = %w(sue Pete alice Tyler rachel Kim bonnie)
# bubble_sort!(array)
# p array == %w(Kim Pete Tyler alice bonnie rachel sue)

# array = %w(sue Pete alice Tyler rachel Kim bonnie)
# bubble_sort!(array) { |first, second| first.downcase <= second.downcase }
# p array == %w(alice bonnie Kim Pete rachel sue Tyler)

# further exploration

def bubble_sort!(array)
  swap_elements = proc { |a, b| array[a], array[b] = array[b], array[a] }

  loop do
    swap_occurred = false

    (1...array.size).each do |index|
      previous_index = index - 1
      first = array[previous_index]
      second = array[index]
      
      no_swap = block_given? ? yield(first) <= yield(second) : (first <= second)
      next if no_swap
      
      swap_elements.call(previous_index, index)
      swap_occurred = true
    end

    break unless swap_occurred
  end
  nil
end

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |value| value.downcase }
array #== %w(alice bonnie Kim Pete rachel sue Tyler)
array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |value| value.length }
p array



