=begin

=end

def count(collection)
  true_counter = 0
  # collection.each { |item| true_counter += 1 if yield(item) }
  for item in collection 
    true_counter += 1 if yield(item)
  end
  true_counter
end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2