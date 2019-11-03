require "socket"

DATE_FORMAT = "%Y-%m-%d %H%s"

loop do
  puts ""
  puts "Welcome to Fortune Cookie!"
  puts "Insert date of birth to know your fortune..."
  birthday = Time.utc.as(Time | String)
  begin
    puts "DAY:"
    date = Array.new(3, 0)
    date[0] = gets.not_nil!.chomp.to_i
    puts "MONTH:"
    date[1] = gets.not_nil!.chomp.to_i
    puts "YEAR:"
    date[2] = gets.not_nil!.chomp.to_i

    birthday = Time.local(date[2], date[1], date[0])
    birthday = birthday.to_s(DATE_FORMAT) + '\n'
  rescue ex
    puts ex.message
    puts "Please introduce a valid value!"
    next
  end

  client = TCPSocket.new("localhost", 8080)

  begin
    client << birthday
    # puts "SENT #{birthday}"
    response = client.gets
    puts "#{response}"
  rescue ex
    puts ex.message
  ensure
    client.close
  end
end
