=begin

=end

def zip(collection_1, collection_2)
  zipped_collection = []
  collection_1.size.times do |index|
    zipped_collection.push([collection_1[index], collection_2[index] ])
  end
  zipped_collection
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]