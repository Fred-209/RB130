require 'minitest/autorun'
require_relative 'cat'

class CatTest <MiniTest::Test
  def setup
    @kitty = Cat.new('Kitty')
  end

  def test_name
    assert_equal(@kitty.name, 'Milo')
    # assert_equal('Milo', @kitty.name)
    # assert(@kitty.name == 'Milo')
    # refute_equal('Kitty', @kitty.name)
  end

  
end