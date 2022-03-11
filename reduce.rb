def reduce(collection, starting_value = nil)
  counter = 0
  starting_value ? acc = starting_value : acc = collection[0]
  first_iteration = true
  while counter < collection.size
    if first_iteration
      if starting_value
        acc = yield(starting_value, collection[0])
        counter += 1
      else
        acc = yield(collection[0], collection[1]) 
        counter += 2
      end
      first_iteration = false
    else
      acc = yield(acc, collection[counter])  
      counter += 1
    end
  end
  acc
end





=begin
Attempt 2
Create a `reduce` method that takes a block from scratch.
It should take a collection argument and an optional argument. The optional argument 
will be assigned the starting value of the `accumulator` if given. Otherwise 
the initial value of the accumulator should be the first element in the collection

#input: collection, optional second argument can be anything really. The
  - method user would have to handle any errors from invoking methods on objects
  that don't have this method defined for them
output: the collection passed in

Rules: 
- can have an optional second argument
- should only iterate over the collection, passing in collection elements to the block 
that should be yielded to.
- The return value of the block should be assigned to be the accumulator value
- on each iteration of this collection, the accumulator is passed in along with the current
iteration elemnt
- On the first iteration, if an optional second argument was given, this value 
should be assigned to the accumulator value. Otherwise the default accumulator value should
be assigned to the collection item at index 0. 
  -if the optional second argument was given and it's the first iteration, the 
    counter should be incremented by 2 instead of 1

Algorithm:
- init a counter variable to 0
- init first_run to true
- Start a loop that breaks once the counter is equal to the size of the collection
  - if first_run
    - if acc is not nil
        reassign acc to = yielding to the block, passing in acc and index 1 from collection
        - increment counter by 1
    -  else acc is nil
        reassign acc to = yielding to block, passing in item from collection at index 0 as the acc
        and the item from the calling collection at index 1
        - increment counter by 2
  - else not first_run
      reassign acc to = yielding to the passed in block, passing arguments acc element at index of 
      `counter` from the collection
      increment counter by 1
  - reassign first_run to false

=end

def reduce(collection, accumulator = nil)
  counter = 0
  first_iteration = true
  while counter < collection.size
    if first_iteration
      if accumulator
        accumulator = yield(accumulator, collection[0])
        counter += 1
      else
        accumulator = yield(collection[0], collection[1])
        counter += 2
      end
      first_iteration = false
    else
      accumulator = yield(accumulator, collection[counter] )
      counter += 1
    end
  end
  accumulator
end


array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }
p reduce(array, 10) { |acc, num| acc + num }
# p reduce(array) { |acc, num| acc + num if num.odd? }

p reduce(%w[a b c]) { |acc, value| acc += value }
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']