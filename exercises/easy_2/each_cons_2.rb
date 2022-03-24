=begin

=end

def each_cons(collection, num_cons = 2)
  return nil if collection.empty?
  
  if num_cons == 1
    collection.each { |item| yield(item)}
    return nil
  end

  first_idx = 0
  second_idx = num_cons
  increment_indexes = proc { first_idx += 1; second_idx += 1 }

  until second_idx > collection.size
    yield(collection[first_idx...second_idx])
    increment_indexes.call
  end
end


hash = {}
each_cons([1, 3, 6, 10], 1) do |value|
  hash[value] = true
end
p hash == { 1 => true, 3 => true, 6 => true, 10 => true }

hash = {}
each_cons([1, 3, 6, 10], 2) do |value1, value2|
  hash[value1] = value2
end
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([1, 3, 6, 10], 3) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6], 3 => [6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 4) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 5) do |value1, *values|
  hash[value1] = values
end
p hash == {}