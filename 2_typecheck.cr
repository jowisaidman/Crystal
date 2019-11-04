# type check union type
# (Int32 | String)
my_string = 32
if rand(2) > 0
  my_string = "hola"
end

# puts typeof(my_string)
# puts my_string.class
# puts my_string.to_s


# Union types

# nullrenf check
# (String | nil)
if rand(2) > 0
  my_string = "hola"
end

# puts my_string.upcase


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

# puts typeof(forma) 
# puts forma.class  