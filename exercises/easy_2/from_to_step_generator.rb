=begin

=end

def step(start_value, end_value, step)
  current_value = start_value
  value_range = []

  until current_value > end_value
    value_range << current_value
    
    yield(current_value)
    current_value += step
  end
  p value_range
end

step(1, 10, 3) { |value| puts "value = #{value}" }