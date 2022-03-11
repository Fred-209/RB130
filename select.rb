# def select(array)
#   return_array = []
#   counter = 0
#   while counter < array.size
#     return_array << array[counter] if yield(array[counter])
#     counter += 1
#   end
#   return_array
# end

# p select([1, 2, 3, 4]) { |number| number > 5 }



=begin
Reproduce the `Enumerable#select` method

input: a collection
output: a new collection consisting of those elements in the given collection
that when passed into an implicit block argument return a truthy value

Rules: 
- input must be a collection (array or hash)
- returns calling collection unless a block is passed in
- returns a new collection with elements from the calling collection 
that a given block returns a truthy value for when yielded to
- collectiojn can contain any data types

Data Structure:
collection => adding to empty collection => new version of collection

Brainstorming: 
- return given collection unless a block is passed in
- create an empty array
- iterate over itemms in the given collection, passing in one at a time to a block
- if the block returns a truthy value, then add this item to the build array from above
- after collection has been fully iterated over, return this build array

Algorithm: (`collection`)
- return `collection` unless a block is given
- init empty array `results`
- Traverse `collection` , `item`
  - yield to the given block, passing in `item` as an argument
  - if the return value of this yield is truthy, add `item` to `results`
- return `results`
=end

def select(collection)
  return collection unless block_given?
  results = []

  collection.each do |item|
    results << item if yield(item)
  end
  results
end

p select([1, 2, 3, 4, -1]) 