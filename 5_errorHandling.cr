# Simple exception
begin
  raise "Lanzo texto"
  raise Exception.new "Lanzo objeto"
rescue exception
  puts "Se produjo el error: #{exception.message}"
end

# Costum
class MyException < Exception
end

begin
  raise MyException.new "Error costum"
  raise Exception.new "Error normal"
rescue costumex : MyException # Mi excepcion 
  puts costumex.message
rescue ex #Cualquier tipo
  puts ex.message
end

# Else
begin
  if rand(2) == 0
    raise "Errrrorrrr"
  end
rescue ex
  puts ex.message
else 
  puts "No hubo error"
end

# ensure
begin
  raise "Error"
rescue ex
  puts ex.message
ensure
  puts "Cleanup..."
end