=begin
input: array
output: new array

-create empty array
- iterate over each element of the collection given and yield each element to an 
an implicitly given block
- the return value of this block should be added to the empty array
- return the empty array
=end

def map(collection)
  collection.each_with_object([]) do |item, modified_collection| 
    modified_collection << yield(item)
  end
end

p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
p map([]) { |value| true } == []
p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]
p map({ a: 5, b: 8}) { |_, value| value > 5 }
