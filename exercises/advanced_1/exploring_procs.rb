# Group 1
# my_proc = proc { |thing| puts "This is a #{thing}." }
# puts my_proc
# puts my_proc.class
# my_proc.call
# my_proc.call('cat')

# Group 2
# my_lambda = lambda { |thing| puts "This is a #{thing}." }
# my_second_lambda = -> (thing) { puts "This is a #{thing}." }
# puts my_lambda
# puts my_second_lambda
# puts my_lambda.class
# my_lambda.call('dog')
# my_lambda.call
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }

# Group 3
# def block_method_1(animal)
#   yield
# end

# block_method_1('seal') { |seal| p seal; p "This is a #{seal}."}
# block_method_1('seal')
# p nil.to_s

# # Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
block_method_2('turtle') { puts "This is a #{animal}."}

=begin

Observations for Group 1:
This code creates a Proc object that gets assigned to the variable my_proc.
This explains why when the `class` method is called on this object, `Proc` is what is returned
and therefore output from that invocation on line 4.
Line 3 just outputs the default representation of a Proc object when it is passed to puts, 
and therefore to_s gets called on it. 

When my_proc is called on line 5 with no argument passed in, the parameter `thing` defined 
in the proc parameter list is not assigned a value.  Therefore, when the block code outputs to the screen
what it does from the code on line 2, nothing is output. This is because of the lenient arity rules
that procs follow.  Any unassigned parameters will return `nil` when referenced, as was the case here
  the the interpolated #{thing} variable.  Nil will output nothing when puts is called on it, so therefore 
  nothing is output.
On line 6, the string `cat` is passed in to the my_proc call, and that gets assigned to the parameter
`thing` as a block local variable. When it is referenced in the block, the string `cat` gets output as this is
the value bound to it. 

This demonstrates how procs handle references to parameters that haven't been assigned to a passed in argument. 
The proc class's lenient arity rules are what allow this to happen, in which the number of passed in arguments to a proc call 
don't have to match the number parameters the proc has defined. 


Observations for Group 2:
This code group overall demonstrates the different syntaxes you can use to create a lambda, and 
it also shows how a lambda's strict arity rules will cause an ArgumentError to be raised if 
the number of arguments passed to a lambda call don't match the number of parameters the lambda has defined. 
This code also highlights how lambdas are Procs as well, just a different type. 
They are made from the Proc class, as shown by calling `class` on a lambda and having it return `Proc`.


Observations for Group 3:

def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| p "This is a #{seal}."}
block_method_1('seal')

This code demonstrates how if a `yield` keyword is used in a method definition, there must be
a block passed in to the method call, otherwise a LocalJumpError will be raised. 
It also demonstrates how if when using the `yield` keyword to pass control of execution to a block, 
that you have to give the `yield` keyword any arguments you wish to pass to this block or otherwise
they won't get passed. This is evident by how line 75 causes this sentence "This is a ." to be printed, 
because `seal` parameter never got assigned a value because no object was yielded to the this block.
 Therefore `nil` is what `seal` would reference, and when `seal` is interpolated, to_s gets called 
 on `nil` which out which results in no output. 
This is an example of the rules for using the `yield` keyword: A LocalJumpError will be raised
if no block is passed in implicitly to the method and a yield is also invoked. 

Observations for Group 4: 

def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
block_method_2('turtle') { puts "This is a #{animal}."}

1. Line 96 outputs what is expected. The `block_method_2` invocation passes in `turtle` as an 
argument and an implicit block. Within the method, the block is yielded to with the `animal` object
passed to it. Execution jumps to this block code, and the `animal` argument gets assigned to the 
block parameter `turtle`. Therefore when `turtle` is referenced within the block in some interpolated
code, it resolves to `turtle` and that is output in this `puts` statement. 

2. The invocation on line 97 causes a lack of output for the `seal` reference that is intperloated in a 
`puts` call because in the code for the `block_method_2`, only one argument is yielded to this block. Therefore, references to `seal` in the block
will return `nil` and that causes a lack of output in the string interpolation. 
Also, the `block_method_2` only takes one argument, as it only has one parameter defined and methods follow strict arity rules. This means the number
of arguments passed to `block_method_2` must match the number of parameters defined in it. 

3. The invocation on line 100 demonstrates how the scope of yielded to blocks work. The block attempts to reference
`animal`, which is a method local variable in `block_method_2` because of `turtle` being passed in as an argument on invocation
and assigned to `animal`.  So `animal` can be referenced inside of `block_method_2`, but the yielding to the implicitly passed in block
causes the code execution point to jump to where the block is defined on line 100. And on line 100, the program is outside of the scope
of the `block_method_2` definition because methods have their own self-contained scope.  `animal` is not visible to the block on line 100, and therefore 
a NameError is raised. 
This demonstrates how yielding to a block causes the code execution to jump to the point of the block code and execute it from that context, 
and that it doesn't execute the block from the scope of the method it's yielded from


=end