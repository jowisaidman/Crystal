# 1) fibers are not immediatelly scheduled to run

# spawn do
#  loop do
#    puts "Hello World!"
#  end
# end

# puts "Hello from main fiber"

# 2) fibers need to be passed a closure for this to work

# spawn do
#  i = 0
#  while i < 10
#    spawn do
#      puts(i)
#    end
#    i += 1
#  end
# end

# Fiber.yield

# 3) fibers can be called with procs

# spawn do
#  i = 0
#  while i < 10
#    print_num = ->(x : Int32) do
#      spawn do
#        puts(x)
#      end
#    end
#    print_num.call(i)
#    i += 1
#  end
# end

# Fiber.yield
