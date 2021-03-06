# Classes and Object

class BookInStock
  def initialize(isbn, price)
    @isbn = isbn
    @price = Float(price)
  end
end

bis = BookInStock.new("isbn1", 3.14)

# Notice how the latter includes inst variables
puts bis
p bis
# Can override the puts method by overriding 'to_s' method

puts """Instance variables start with an ampersat - @varA 
This helps the interpreter to recognise not a local variable. 
Ie   python 'self.hey' -> '@hey'

Eg:

class X
  def initialize(a)
    @a = a
  end
end
""" 

puts """
In general, attributes are private in ruby, so you need to define accessors. 
There are two ways to do this

1) Explicitly as functions:
    
    def isbn
      @isbn      # Ruby returns last executed line
    end

    def isbn=(i)
      @isbn = i
    end

2) Using built-in function attr_reader
   
    class X
      attr_reader :a :b.  # simply defines READ accessor methods for 'names' a, b;
      attr_writer :c.     # WRITE
      attr_accessor       # READ-WRITE aka ACCESSOR

      def initialise (a, b, c, d, e)
        @a = a
        @b = b
        @c = c
        @d = d
        @e = e # not exposed
      end
    end
"""

class AccessThis
  attr_reader :read_only_int
  attr_accessor :read_write_str

  def initialize(a, b)
    @read_only_int = a
    @read_write_str = b
  end 

  def virtual_attribute()
    @read_only_int * 10 
  end

  def virtual_attribute=(rhs)
    @read_only_int = rhs / 10 
  end

end

at = AccessThis.new(123, "hey bud")

puts at.read_only_int
# puts at.read_only_int = 5. # ERROR
puts at.virtual_attribute
at.virtual_attribute = 567
puts at.virtual_attribute
puts at.read_only_int

# This is quite naughty getting around the READ ONLY and shows that in ruby: 
puts """
'Real' attributes (instance variables) are mutable, but **private by default**,
Therefore you only expose them by defining accessors for reading and writing.

But if you dont have an instance variable, you can just define 2 methods 'def x()' and 'def x=(rhs)'
and these are separate methods, which enable you do reading and assignment none the less.

These are called 'Virtual' Attributes and mean you can define your interface, 
while hiding your implementation. They look and behave just like attributes. 

See example AccessThis in this file to look.
"""

puts "-------------------------------------"


puts """
We can refer/import other files using the require keyword:

require 'csv' # requires Ruby's csv module
require_relative 'xyz' #requires a module relative to this one

"""



