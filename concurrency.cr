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

# Channels

# channel = Channel(Int32).new

# spawn do
# puts "Before first send"
# channel.send(1)
# puts "Before second send"
# channel.send(2)
# end

# puts "Before first receive"
# value = channel.receive
# puts value # => 1

# puts "Before second receive"
# value = channel.receive
# puts value # => 2

# A buffered channel of capacity 2

# channel = Channel(Int32).new(2)

# spawn do
# puts "Before send 1"
# channel.send(1)
# puts "Before send 2"
# channel.send(2)
# puts "Before send 3"
# channel.send(3)
# puts "After send"
# end

# 3.times do |i|
# puts channel.receive
# end
