# A Proc represents a function pointer 
# with an optional context (the closure data). 
# It is typically created with a proc literal:

def lower(x : String)
  x.downcase
end

num = 10
x = 1
chau = "CHAU"

puts "num = #{num}"
puts "Type of num = #{typeof(num)}"
puts "x = #{x}"
puts "Type of x = #{typeof(x)}"
puts "chau = #{chau}"
puts "Type of chau = #{typeof(chau)}"

# Definicion de Proc
to_string = Proc(Int32, String).new { |x| x.to_s }
add_one = ->(i : Int32) {x += i}
to_lower = ->lower(String)

num = to_string.call num
add_one.call 10
chau = to_lower.call chau

puts "\nAfter proc"
puts "num = #{num}"
puts "Type of num = #{typeof(num)}"
puts "x = #{x}"
puts "Type of hola = #{typeof(x)}"
puts "chau = #{chau}"
puts "Type of chau = #{typeof(chau)}"


# Yields 

def twice
  yield
  yield
end

twice do
  puts "Hello!"
end

# Yield modifing
class Foo
  def one
    1
  end

  def yield_with_self
    with self yield # Para correr el propio
  end

  def yield_normally
    yield
  end
end

def one
  "one"
end

Foo.new.yield_with_self { one } # => 1
Foo.new.yield_normally { one }  # => "one"

# adder = ->mult(Int32, Int32)
# adder.call(1, 2) #=> 2