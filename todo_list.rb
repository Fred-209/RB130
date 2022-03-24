# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end


# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_reader :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def all_done
    select { |todo| todo.done? }
  end

  def all_not_done
    select { |todo| !todo.done? }
  end

  def each
    todos.each { |todo| yield(todo)}
    self
  end

  def find_by_title(todo_title)
    found_title = select { |todo| todo.title == todo_title}.first
    found_title ? found_title : puts("That is not a valid title.")
  end

  def select
    results = TodoList.new(title)
    each { |todo| results << todo if yield(todo) }
    results
  end

  def add(todo)
    raise(TypeError.new, 'Can only add Todo objects') unless todo.is_a?(Todo)

    todos << todo
  end

  def size
    todos.size
  end

  def first
    todos.first
  end

  def last
    todos.last
  end

  def to_a
    todos
  end

  def done?
     todos.all?(&:done?)
  end

  def done!
    todos.each(&:done!)
  end

  def item_at(index)
    todos.fetch(index)
  end

  def mark_done(todo_title)
    found_title = find_by_title(todo_title)
    found_title.done! if found_title
  end

  def mark_done_at(index)
    item_at(index).done!
  end

  def mark_undone_at(index)
   item_at(index).undone!
  end

  def remove_at(index)
    raise(IndexError.new, "Index #{index} out of range.") if index > (size - 1)
    todos.delete(item_at(index))
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def to_s
    text = "---- #{title} ----\n"
    text << todos.map(&:to_s).join("\n")
    text
  end

  def undone!
    todos.each(&:undone!)
  end

  alias_method :<<, :add
  alias_method :mark_all_done, :done!
  alias_method :mark_all_undone, :undone!

  private

  attr_accessor :todos
end



# todo1 = Todo.new("Buy milk")
# todo2 = Todo.new("Clean room")
# todo3 = Todo.new("Go to gym")

# list = TodoList.new("Today's Todos")
# list.add(todo1)
# list.add(todo2)
# list.add(todo3)

# # todo1.done!

# results = list.select { |todo| todo.done? }    # you need to implement this method

# puts results.inspect
# p list.find_by_title('Buymilk')
# p list.all_done
# p list.all_not_done
# p list.mark_done('Buy mlk')
# p list
