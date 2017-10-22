class About
  include Cinch::Plugin

  match /about/, method: :about
  match /ping/, method: :ping
  match /uptime/, method: :uptime
  match /bug (.+)/, method: :bug
  match /suggestion (.+)/, method: :bug
  match /issue (.+)/, method: :bug

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

  def bug(m, args)
    if CONFIG['ownerhost'] == m.user.host
      begin
        url = `hub issue create -m "#{args}"`
        m.reply "Issue created! #{url}"
      rescue => e
        User(m.user.nick).send(e)
        m.reply 'An error has occured. The error message has been sent to you in a private message. Please report this (ironically to the issues) or on the official irc channel.'
      end
    else
      m.reply 'You must be the bot owner to create an issue! Try making one manually: http://github.com/Chewbotcca/IRC/issues/new'
    end
  end
end
