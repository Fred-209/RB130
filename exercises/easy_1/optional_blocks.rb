def compute(arg)
  block_given? ? yield(arg) : 'Does not compute.'
end

# p compute { 5 + 3 } == 8
# p compute { 'a' + 'b' } == 'ab'
# p compute == 'Does not compute.'

p compute(3) { |num| num + 1 }
p compute(3)