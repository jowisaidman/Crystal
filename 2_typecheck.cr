
if 
# Type reference
def shout(x)
  # Notice that both Int32 and String respond_to `to_s`
  x.to_s.upcase
end

foo = ENV["FOO"]? || 10

puts foo
puts typeof(foo) # => (Int32 | String)
puts typeof(shout(foo)) # => String

# Union types

# nullrenf check
# (String | nil)
if rand(2) > 0
  my_string = "hola"
end

# puts my_string.upcase

# type check union type
# (Int32 | String)
my_string = 32
if rand(2) > 0
  my_string = "hola"
end

puts typeof(my_string)
puts my_string.class
puts my_string.to_s

# set the compile-time type
zero = 0.as(Int32|Nil|String)
puts typeof(zero) # => Int32 | Nil | String

# Classes union types

class Forma
end

class Cuadrado < Forma
end

class Redondel < Forma
end

cuadrado = Cuadrado.new
redondel = Redondel.new

lados = 4

forma = lados > 1 ? cuadrado : redondel

puts typeof(forma) 
puts forma.class  