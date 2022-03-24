class Tree
  include Enumerable
  attr_accessor :collection

  def initialize
    @collection = []
  end

  def add_item(item)
    collection << item
  end

  def each
     collection.each { |item| yield item }
  end
end

test = Tree.new
10.times { |item| test.add_item(item)}
test.each { |item| puts item }
