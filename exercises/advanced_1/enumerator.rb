=begin
Factorial sequence as an enumerator

input: integer to find factorial sequence of

- sequence should always start at one
- Iterate over a range from 1 through the given number
- multiply current number in iteration by accumulator
- repeat this until 
=end

factorial_enumerator = Enumerator.new do |yielder|
  
  acc = 0
  fact_count = 1
  
  loop do
    acc = acc.zero? ? 1 : acc * fact_count
    yielder << acc
    fact_count += 1
  end
end

7.times { p factorial_enumerator.next }
p factorial_enumerator.next
factorial_enumerator.rewind
7.times { p factorial_enumerator.next }

