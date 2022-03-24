=begin

=end

def each_cons(collection)
  return nil if collection.empty?

  first_idx = 0
  second_idx = 1
  increment_indexes = proc { first_idx += 1; second_idx += 1 }

  until second_idx == collection.size
    yield(collection[first_idx], collection[second_idx])
    increment_indexes.call
  end
end

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
p result == nil
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
p hash == {}
p result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
p hash == {'a' => 'b'}
p result == nil