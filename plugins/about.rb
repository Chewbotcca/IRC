class About
  include Cinch::Plugin

  match /about/, method: :about
  match /ping/, method: :ping

  def about(m)
    m.reply 'Chewbotcca is a bot by Chewsterchew. Check it out: https://git.io/ChewbotccaIRC'
  end

  def ping(m)
    m.reply "Hello yes i am alive. ready for action. beep beep boop boop. Oh by the way that ping took #{(Time.now - m.time)*1000.to_i} ms."
  end
end
