items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  yield(items)
  puts "Let's start gathering food."
  yield(items)
  puts "Nice selection of food we have gathered!"
end

gather(items) { |produce| puts produce.join(', ')}