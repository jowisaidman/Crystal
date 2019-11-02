# Hello world basico 
puts "Hello World!"


# Hello World objetos
class Greeter

  def initialize(@name : String )
  end

  def salute
    puts "Hello #{@name}!"
  end

end

g = Greeter.new("world")

g.salute

