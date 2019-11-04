
# Parametros de alguna forma hay que definir el tipo
class Person
  @name : String
  def initialize(name)
    @name = name
  end

  def salute
    puts "Hello i'm #{@name}!"
  end

end

g = Person.new "TDL"

# g.salute  

# Typ restriccions
class Seis
  def +(other : Number )
    return 6 + other
  end
end

def add(x, y)
  x + y
end

numero = add Seis.new, 10
puts numero

def restricted_add(x : Number, y : Number)
  x + y
end

# puts restricted_add Six.new, 10

# Jugar con los parametros y mostarr que de aguna forma tiene que esta definido
# 1. recibimos name y declaramos @name y mostarmos que tira error y declaramos @age = 10
# 2. recibimos name con @name : String como atributo y tambien age como atributo @age : Int32
# 3. recibimos name con name : String y lo asignamos y aca ya lo definimos con @age = 10 y decimos que hace solo lo del tipado
# 4. recibimos @name : String sin definir nada antes, explicar restriccions

# Mostrar Macros
# Property age mostar setter y getter, y como se definen
# getter name : string mostrar como usarlo
  # @name : String 
  # property age : Int32 = 10
  # property name : String

#primer add
# add method without type restrictions
#segundo add
# Error type