class Ping
  include Cinch::Plugin

  match /ping/, method: :ping

  def ping(m)
    m.reply "Pong! Ping: #{((Time.now - event.timestamp) * 1000).to_i}ms."
  end
end
