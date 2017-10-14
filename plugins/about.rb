class About
  include Cinch::Plugin

  match /about/, method: :about
  match /ping/, method: :ping
  match /uptime/, method: :uptime

  def about(m)
    m.reply 'Chewbotcca is a bot by Chewsterchew. Check it out: https://git.io/ChewbotccaIRC'
  end

  def ping(m)
    m.reply "Hello yes i am alive. ready for action. beep beep boop boop. Oh by the way that ping took #{(Time.now - m.time) * 1000.to_i} ms."
  end

  def uptime(m)
    t = Time.now - STARTTIME
    mm, ss = t.divmod(60)
    hh, mm = mm.divmod(60)
    dd, hh = hh.divmod(24)
    m.reply format('Uptime: %d days, %d hours, %d minutes and %d seconds', dd, hh, mm, ss)
  end
end
