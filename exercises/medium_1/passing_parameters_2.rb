def classify_birds(bird_list)
  yield(bird_list)
end

classify_birds(%w[raven finch hawk eagle]) { |_, _, *raptors| puts raptors}