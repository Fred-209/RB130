=begin
Write a method that returns a list of all of the divisors of the positive integer 
passed in as an argument. The return value can be in any sequence you wish.

input: integer
output: array of integers

Rules:
- return array can be in any order

Examples: 
p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute


Data Structure: 
integer => array of integers that are divisors of integer

Brainstorming: 
- a divisor of a number is a number that the number can be divided by evenly with
remainder
- Iterate over a range of numbers from 1 through half the value of given integer
  - only need to go up to halfway because anything higher than halfway and the given 
  integer couldn't be divided by, since number / 2 is largest possible divisor
- need to tack on given number to end of array, as all numbers can be divided by 
themselves and one

Algorithm: given - `number`
- return 1 if given number is one
- init `midpoint` to be equal to `number` / 2
- Iterate over range from 1..`midpoint` and select those numbers in which 
when `number` mod current_number is 0
- return above selected array


=end

def divisors(number)
  # return [number] if number == 1

  midpoint = number / 2
  (1..midpoint).select { |num| number % num == 0} << number
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute

#further exploration