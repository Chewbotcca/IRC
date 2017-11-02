class Restart
  include Cinch::Plugin

  match /restart/, method: :restart
  match /update/, method: :update

  def restart(m)
    if m.user.host == CONFIG['ownerhost']
      m.reply 'Restarting the bot without updating...'
      sleep 1
      if CONFIG['bundler'] == true
        exec('bundle exec ruby bot.rb')
      else
        exec('ruby bot.rb')
      end
    else
      m.reply "You can't restart! (If you are the owner of the bot, you did not configure properly! Otherwise, stop trying to restart the bot!)"
    end
  end

  def update(m)
    if m.user.host == CONFIG['ownerhost']
      m.reply 'Restarting and Updating!'
      sleep 1
      `git pull`
      if CONFIG['bundler'] == true
        exec('bundle exec ruby bot.rb')
      else
        exec('ruby bot.rb')
      end
    else
      m.reply "You can't update! (If you are the owner of the bot, you did not configure properly! Otherwise, stop trying to update the bot!)"
    end
  end
end
