class About
  include Cinch::Plugin

  match /about/, method: :about
  match /ping/, method: :ping

  def about(m)
    m.reply 'Chewbotcca is a bot by Chewsterchew. Check it out: https://git.io/ChewbotccaIRC'
  end

  def ping(m)
    m.reply 'Hello yes i am alive. ready for action. beep beep boop boop.'
  end
end
