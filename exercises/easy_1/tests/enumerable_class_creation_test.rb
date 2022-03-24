require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative('../enumerable_class_creation')

class EnumerableClassCreationTest < Minitest::Test

  def setup
    @tree = Tree.new
  end

  def test_add_item
    @tree.add_item(1)
    # assert_equal([1], @tree.collection)
    assert_equal(@tree.collection, [1])
  end


end