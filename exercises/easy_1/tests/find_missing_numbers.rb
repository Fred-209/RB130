=begin
GWrite a method that takes a sorted array of integers as an argument, and returns 
an array that includes all of the missing integers (in order) between the first 
and last elements of the argument.

input: array of integers (sorted in ascending order)
output: array of integers (consisting of those missing from given array)

Rules: 
- given array of integers is sorted in ascending order
- return new array that consists of all those numbers missing between the first 
last elements of the given array
  - a number is missing a number one index higher than current number is not
    1 number higher
- return array must be in order


Examples:
missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
missing([1, 2, 3, 4]) == []
missing([1, 5]) == [2, 3, 4]
missing([6]) == []

Data Structure: 
array of integers => iteration over array => new array of missing integers

Brainstorming: 
- create an empy array to add missing integers to
- Iterate over given range from first given integer from array + 1 to last integer 
given - 1
- If the given array includes this current number, do nothing but it it does not
  include it, append this number to build array
- return build array

Alternative approach:
- create an array of numbers in range from first number in array to last number in array
- return the result of subtracting given array from this array

Algorithm: 
- init empty array `missing_numbers`
=end

def missing(arr)
  (arr.first..arr.last).to_a - arr
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []