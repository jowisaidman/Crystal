# Linking with C
@[Link("m")]

lib C
  # En C: double cos(double x)
  fun log(value : Float64) : Float64
end


puts C.log(90)


# Comparar con Crystal

puts Math.log(90_f64)