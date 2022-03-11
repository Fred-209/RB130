def times(num_iterations)
  counter = 0

  while counter < num_iterations
    yield(counter)
    counter += 1
  end

  num_iterations
end