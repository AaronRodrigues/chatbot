require 'socket'
require 'logger'

class Twitch

attr_reader :logger, :running, :socket

  def initialize(logger = nil)
    @logger  = logger || Logger.new(STDOUT)
    @running = false
    @socket  = nil
  end

end