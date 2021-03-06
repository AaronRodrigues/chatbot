require 'dotenv/load'
TWITCH_CHAT_TOKEN = ENV['TWITCH_CHAT_TOKEN']
TWITCH_USER       = ENV['TWITCH_USER']

require 'socket'
require 'logger'

Thread.abort_on_exception = true

class Twitch
  attr_reader :logger, :running, :socket

  def initialize(logger = nil)
    @logger  = logger || Logger.new(STDOUT)
    @running = false
    @socket  = nil
  end

  def send(message)
    logger.info "< #{message}"
    socket.puts(message)
  end

  def run
    logger.info 'Preparing to connect...'

    @socket = TCPSocket.new('irc.chat.twitch.tv', 6667)
    @running = true

    socket.puts("PASS #{TWITCH_CHAT_TOKEN}")
    socket.puts("NICK #{TWITCH_USER}")

    logger.info 'Connected...'

    Thread.start do
      while (running) do
        ready = IO.select([socket])

        ready[0].each do |s|
          line    = s.gets
          match   = line.match(/^:(.+)!(.+) PRIVMSG #(.+) :(.+)$/)
          message = match && match[4]

          if message =~ /^!hello/
            user = match[1]
            logger.info "USER COMMAND: #{user} - !hello"
            send "PRIVMSG #azraellives :Hello, #{user} from Mailbot!"
            elsif message =~ /^!sup/
            user = match[1]
            logger.info "USER COMMAND: #{user} - !sup"
            send "PRIVMSG #azraellives :Sup Dawg, #{user} from Mailbot! Welcome to da hood!"   
            elsif message =~ /^!hows it going?/
            user = match[1]
            logger.info "USER COMMAND: #{user} - !hows it going?"
            send "PRIVMSG #azraellives :You know how it is, #{user}! We be chillin' Where have you been?"
            elsif message =~ /^!home/
            user = match[1]
            logger.info "USER COMMAND: #{user} - !home"
            send "PRIVMSG #azraellives :Fer Realz? #{user}! You gotta get out more!"        	
          end

          logger.info "> #{line}"
        end
      end
    end
  end

  def stop
    @running = false
  end
end

if TWITCH_CHAT_TOKEN.empty? || TWITCH_USER.empty?
  puts "You need to fill in your own Twitch credentials!"
  exit(1)
end

bot = Twitch.new
bot.run

while (bot.running) do
  command = gets.chomp

  if command == 'quit'
    bot.stop
  else
    bot.send(command)
  end
end

puts 'Exited.'