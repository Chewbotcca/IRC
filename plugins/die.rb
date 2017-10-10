class Die
  include Cinch::Plugin

  match /die/, method: :die

  def die(m)
    if m.user.host == CONFIG['ownerhost']
      m.reply 'Shutting down the bot peacefully...'
      exit
    else
      m.reply "You can't kill the bot! (If you are the owner of the bot, you did not configure properly! Otherwise, stop trying to KILL the bot!)"
    end
  end
end
