require "socket"
require "file"
require "file_utils"
require "time"

EOL               = '\n'
DELIMITER         = '%'
FORTUNE_FILE_PATH = "fortunes/fortunes"
DATE_FORMAT       = "%Y-%m-%d"
PRINT_MSG         = "CLIENT SENT "

channel = Channel(String).new

def handle_client(client, c)
  birthday = Time.utc.as(Time | String) # declare variable as a Union Type

  puts "New client arrived!"
  birthday = client.gets.not_nil!.chomp

  # puts "client sent birthday #{birthday}"

  fortune_cookie = FortuneCookie.new FORTUNE_FILE_PATH
  birthday = Time.parse(birthday, DATE_FORMAT, Time::Location.local)

  fortune = fortune_cookie.get_fortune(birthday)

  c.send(PRINT_MSG + "#{birthday}")

  client.send(fortune)
  # puts "Fortune Cookie: #{fortune}"
end

class FortuneCookie
  def initialize(fortunes_path : String)
    @fortunes_path = fortunes_path
  end

  def fortunes_path
    @fortunes_path
  end

  def get_fortune(date_of_birth : Time) : String
    epoch = date_of_birth.to_unix_ms

    # read fortune file and return fortune phrase
    size = File.size(@fortunes_path)
    r = Random.new(epoch)
    content = File.open(@fortunes_path, "r") do |fortune_cookie|
      random_pos = r.rand(size)
      fortune_cookie.seek(random_pos, IO::Seek::Set)
      fortune_cookie.gets(DELIMITER)
      fortune = fortune_cookie.gets(DELIMITER)
      if fortune.nil?
        fortune_cookie.seek(0, IO::Seek::Set)
        fortune = fortune_cookie.gets(DELIMITER)
      end
      fortune.to_s.delete(EOL).delete(DELIMITER) + EOL
    end
  end

  # def finalize
  #  puts "I am dead now..."
  # end
end

spawn do
  loop do
    line = channel.receive
    puts "------------------------"
    puts "INFO: #{line}"
    puts "------------------------"
  end
end

server = TCPServer.new("localhost", 8080)
while client = server.accept?
  spawn handle_client(client, channel)
end
