# fib.cr
def fib(n)
  if n <= 1
    1
  else
    fib(n - 1) + fib(n - 2)
  end
end

# call fibonacci and print value
puts fib(42)

# time crystal performance.cr
# time ruby performance.cr
