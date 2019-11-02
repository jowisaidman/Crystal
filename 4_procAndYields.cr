# A Proc represents a function pointer 
# with an optional context (the closure data). 
# It is typically created with a proc literal:

def lower(x : String)
  x.downcase
end

num = 1
hola = "hola"
chau = "CHAU"

puts "num = #{num}"
puts "Type of num = #{typeof(num)}"
puts "hola = #{hola}"
puts "Type of hola = #{typeof(hola)}"
puts "chau = #{chau}"
puts "Type of chau = #{typeof(chau)}"

# Definicion de Proc
to_string = Proc(Int32, String).new { |x| x.to_s }
to_upper = ->(str : String) {str.upcase}
to_lower = ->lower(String)

num = to_string.call num
hola = to_upper.call hola
chau = to_lower.call chau

puts "\nAfter proc"
puts "num = #{num}"
puts "Type of num = #{typeof(num)}"
puts "hola = #{hola}"
puts "Type of hola = #{typeof(hola)}"
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
    with self yield
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


# Blockas and procs
def int_to_int(&block : Int32 -> Int32)
  block
end

proc = int_to_int { |x| x + 1 }
proc.call(1) #=> 2

#Create proc from methods
def mult(x, y)
  x * y
end

adder = ->add(Int32, Int32)
adder.call(1, 2) #=> 2