=begin
input: array
output: array

- Iterate over given array and return a new array that consists of those elements
left in given array after the given block is yielded to and returns a false value
- make sure to include this first element for which the block returned false in 
the return array

Algorithm:
- Iterate over given array, `num`, with index `index`
  - yield num to block
  - if return value of yielding num to block is true, skip to next iteration
  - if block return is false, 
    - return a subarray sliced from given array from [index..]
- return [] if above completes without returning

=end

def drop_while(collection)
  collection.each_with_object([]).with_index do |(item, _), index|
    return collection[index..] unless yield(item)
  end
end

p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []