require 'simplecov'
SimpleCov.root('../')
SimpleCov.start

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative '../todo_list'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    todo = @list.shift
    assert_equal(@todo1, todo)
    assert_equal([@todo2, @todo3], @list.to_a)  
  end

  def test_pop
    todo = @list.pop
    assert_equal(@todo3, todo)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    refute(@list.done?)
    @list.mark_done_at(0)
    refute(@list.done?)
    @list.done!
    assert(@list.done?)
  end

  def test_only_todo_allowed_in_list
    assert_raises(TypeError) { @list << 4}
    assert_raises(TypeError) { @list << 't'}
  end

  def test_shovel_operator
    new_todo = Todo.new('Test Todo')
    @list << new_todo
    @todos << new_todo

    assert_equal(@todos, @list.to_a)
  end

  def test_add_method
    new_todo = Todo.new('Test Todo')
    @list.add(new_todo)
    @todos << new_todo
  end

  def test_item_at
    assert_raises(IndexError) {@list.item_at(8)}
    assert_equal(@todo1, @list.item_at(0))
    assert_equal(@todo2, @list.item_at(1))
  end

  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at(100)}
    @list.mark_done_at(1)
    assert_equal(true, @list.to_a[1].done?)
    assert_equal(false, @todo1.done?)
    assert_equal(false, @todo3.done?)
  end

  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_undone_at(100)}
    @list.done!
    assert_equal(true, @todo1.done?)

    @list.mark_undone_at(0)

    assert_equal(false, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_done!
    assert_equal(false, @list.done?)
    
    @list.done!

    assert_equal(true, @list.done?)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(100)}

    @list.remove_at(0)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_to_s
    output =
      <<~OUTPUT.chomp
        ---- Today's Todos ----
        [ ] Buy milk
        [ ] Clean room
        [ ] Go to gym
      OUTPUT
  
    assert_equal(output, @list.to_s)

    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
    @list.mark_done_at(0)
    
    assert_equal(output, @list.to_s)

    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT
    @list.mark_all_done

    assert_equal(output, @list.to_s)
  end

  def test_each
    counter = 0
    output = @list.each do |todo|
      assert_equal(todo, @list.item_at(counter))
      counter += 1
    end

    assert_equal(output, @list)
  end

  def test_select
    @todo1.done!

    filtered_list = @list.select { |todo| todo.done?}
    assert_equal([@todo1], filtered_list.to_a)
  end

  def test_all_done
    @todo1.done!
    @todo2.done!

    assert_equal([@todo1, @todo2], @list.all_done.to_a)
  end

  def test_all_not_done
    @todo1.done!
    @todo2.done!

    assert_equal([@todo3], @list.all_not_done.to_a)
  end

  def test_find_by_title
    todo = @list.find_by_title('Buy milk')
    assert_equal(@todo1, todo)
    assert_nil(@list.find_by_title('fake title'))
  end

  def test_mark_done
    @list.mark_done('Buy milk')
    assert_equal(true, @todo1.done?)

    @list.mark_done('fake title')
    assert_equal(false, @todo2.done?)
  end

  def test_undone!
    @todo1.done!
    @todo2.done!

    @list.undone!
    assert( @list.to_a.none?(&:done?) )
  end

end